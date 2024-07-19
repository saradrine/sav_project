import 'package:flutter/material.dart';
import 'package:sav_project/models/vehicule.dart';
import 'package:sav_project/theme/colors.dart';

class MileageElement extends StatefulWidget {
  final Vehicule vehicule;
  const MileageElement({Key? key, required this.vehicule}) : super(key: key);

  @override
  State<MileageElement> createState() => _MileageElementState();
}

class _MileageElementState extends State<MileageElement> {
  @override
  Widget build(BuildContext context) {
    final intervalKilometrage = widget.vehicule.intervalKilometrage ?? 0;
    final kilometrage = widget.vehicule.kilometrage ?? 0;
    final dernierVidange = widget.vehicule.dernierVidange ?? 0;

    final remainingKm = intervalKilometrage - (kilometrage - dernierVidange);

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
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.lightGreen,
              child: Image.asset(
                'assets/icons/car-oil.png',
                width: 30,
                height: 30,
                color: AppColors.iconColor,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.vehicule.marque} - ${widget.vehicule.modele}',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Actuel: ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '${kilometrage} km',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Restant pour vidange: ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '${remainingKm} km',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
