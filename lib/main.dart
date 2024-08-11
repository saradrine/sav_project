import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/graphql/graphql_client.dart';
import 'package:sav_project/graphql/queries/auth_queries.dart';
import 'package:sav_project/providers/auth_provider.dart';
import 'package:sav_project/providers/services_provider.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/screens/account_confirmation/account_confirmation.dart';
import 'package:sav_project/screens/account_confirmation/confirmation_failure.dart';
import 'package:sav_project/screens/account_confirmation/confirmation_success.dart';
import 'package:sav_project/screens/auth/reset_password_form.dart';
import 'package:sav_project/screens/layout.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/screens/auth/signUp.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.kBaseColor,
    systemNavigationBarColor: const Color.fromARGB(255, 246, 248, 251),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await initHiveForFlutter();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicesProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<String?>? _sub;
  String? initialLink;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initUniLinks();
    });
  }

  Future<void> _initUniLinks() async {
    try {
      initialLink = await getInitialLink();
      if (initialLink != null) {
        _handleLink(initialLink!);
      }
      _sub = linkStream.listen((String? link) {
        if (link != null) {
          _handleLink(link);
        }
      }, onError: (err) {
        print('Error listening for links: $err');
      });
    } catch (e) {
      print('Failed to get initial link: $e');
    }
  }

  void _handleLink(String link) async {
    final uri = Uri.parse(link);
    if (uri.path == '/verify') {
      final token = uri.queryParameters['token'];
      final email = uri.queryParameters['email'];
      if (token != null && email != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EmailVerificationScreen(token: token, email: email),
          ),
        );
      }
    } else if (uri.path == '/reset-password') {
      final token = uri.queryParameters['token'];
      if (token != null) {
        final intent = AndroidIntent(
          action: 'android.intent.action.MAIN',
          package: 'com.example.sav_project',
          componentName: 'com.example.sav_project.MainActivity',
          flags: <int>[
            Flag.FLAG_ACTIVITY_NEW_TASK,
            Flag.FLAG_ACTIVITY_CLEAR_TASK
          ],
        );
        try {
          await intent.launch();
          Navigator.of(context).pop();
        } catch (e) {
          print('Error launching intent: $e');
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordForm(token: token),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<UserProvider>().fetchUserById('2');
    // context.read<UserProvider>().createVehicle();
    context.read<ServicesProvider>().fetchServices(context);
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        bool isLoggedIn = authProvider.token != null;
        // bool isLoggedIn = false;

        print('context: $context');
        if (isLoggedIn) {
          // Print the token when logged in
          print('User is logged in. Token: ${authProvider.token}');
          print(authProvider.user?.id);
        } else {
          // Print a message when the user is not logged in
          print('User is not logged in. Token: ${authProvider.token}');
          print(authProvider.user?.id);
        }

        Widget mainWidget;

        if (initialLink != null) {
          final uri = Uri.parse(initialLink!);
          if (uri.path == '/verify') {
            final token = uri.queryParameters['token'];
            final email = uri.queryParameters['email'];
            if (token != null && email != null) {
              mainWidget = EmailVerificationScreen(token: token, email: email);
            } else {
              mainWidget = isLoggedIn ? Layout() : Login();
            }
          } else if (uri.path == '/reset-password') {
            final token = uri.queryParameters['token'];
            if (token != null) {
              mainWidget = ResetPasswordForm(token: token);
            } else {
              mainWidget = isLoggedIn ? Layout() : Login();
            }
          } else {
            mainWidget = isLoggedIn ? Layout() : Login();
          }
        } else {
          mainWidget = isLoggedIn ? Layout() : Login();
        }
        
        return GraphQLProvider(
          client: GraphqlClient.client(context),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'inter',
              scaffoldBackgroundColor: isLoggedIn
                  ? AppColors.mainBackgroundColor
                  : AppColors.authBachkroundColor,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: const Color.fromARGB(255, 99, 99, 99),
                selectionHandleColor: const Color.fromARGB(255, 99, 99, 99),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: mainWidget,
          ),
        );
      },
    );
  }
}

class EmailVerificationScreen extends StatefulWidget {
  final String token;
  final String email;

  EmailVerificationScreen({required this.token, required this.email});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _verifyEmail();
  }

  Future<void> _verifyEmail() async {
    try {
      print('Verifying email with token: ${widget.token}');
      bool isVerified = await context
          .read<AuthProvider>()
          .verifyEmail(context, widget.token, widget.email);
      print('Email verification result: $isVerified');

      if (isVerified) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationSuccess(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationFailure(),
          ),
        );
      }
    } catch (error) {
      print('Error during email verification: $error');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationFailure(),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading ? CircularProgressIndicator() : Container(),
      ),
    );
  }
}
