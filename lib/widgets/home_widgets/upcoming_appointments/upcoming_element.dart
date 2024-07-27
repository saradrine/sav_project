import 'package:flutter/material.dart';
import 'package:sav_project/models/historiqueRDV.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:intl/intl.dart';

class UpcomingElement extends StatefulWidget {
  final Historiquerdv historique;
  const UpcomingElement({Key? key, required this.historique}) : super(key: key);
  @override
  State<UpcomingElement> createState() => _UpcomingElementState();
}

class _UpcomingElementState extends State<UpcomingElement> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMd().format(widget.historique.date);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 0),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.historique.vehicule!.marque} - ${widget.historique.vehicule!.modele}',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: 'Vous avez un service de ',
              style: TextStyle(
                fontSize: 13,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${widget.historique.service!.nom} ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' prévu.',
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 5),
              Image.asset(
                'assets/icons/calendar.png',
                width: 20,
                height: 20,
                color: AppColors.iconColor,
              ),
              SizedBox(width: 5),
              Text(
                formattedDate.toString() +
                    ', ' +
                    widget.historique.heure.toString(),
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.iconColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
