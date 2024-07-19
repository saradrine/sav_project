import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/models/historiqueRDV.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/theme/colors.dart';
import '../widgets/historique_element.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  
  void onDismissed(Historiquerdv historique) {
    setState(() {
      // historiques.remove(historique);
    });
  }

  @override
  Widget build(BuildContext context) {
   User? user = context.watch<UserProvider>().user;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
        child: user!.appointments.isEmpty
            ? Center(
                child: Text(
                  "Vous n'avez encore aucun historique.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.emptyTextColor,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: user.appointments.length,
                itemBuilder: (context, index) {
                  return HistoriqueElement(
                    historique: user.appointments[index],
                    onDismissed: onDismissed,
                  );
                },
              ),
      ),
    );
  }
}
