import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/graphql/graphql_client.dart';
import 'package:sav_project/providers/services_provider.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/screens/account_confirmation/account_confirmation.dart';
import 'package:sav_project/screens/account_confirmation/confirmation_failure.dart';
import 'package:sav_project/screens/account_confirmation/confirmation_success.dart';
import 'package:sav_project/screens/layout.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/screens/auth/signUp.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.kBaseColor,
    systemNavigationBarColor: const Color.fromARGB(255, 246, 248, 251),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await initHiveForFlutter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicesProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    context.read<UserProvider>().fetchUserById('24');
    context.read<ServicesProvider>().fetchServices();
    return GraphQLProvider(
      client: GraphqlClient.client,
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
        home: !isLoggedIn ? Layout() : ConfirmationFailure(),
      ),
    );
  }
}
