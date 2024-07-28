import 'package:flutter/material.dart';
import 'package:sav_project/models/vehicule.dart';
import 'package:sav_project/theme/colors.dart';
import 'car_information.dart';

// Constants for styles
const _textStyle = TextStyle(
    color: AppColors.iconColor, fontWeight: FontWeight.w500, fontSize: 14);

class VehiculeElement extends StatefulWidget {
  final Vehicule vehicule;
  final Function(Vehicule) onDismissed;

  const VehiculeElement(
      {Key? key, required this.vehicule, required this.onDismissed})
      : super(key: key);

  @override
  State<VehiculeElement> createState() => _VehiculeElementState();
}

class _VehiculeElementState extends State<VehiculeElement> {
  void _showOptionsDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${widget.vehicule.marque} - ${widget.vehicule.modele}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 1.5,
                color: Colors.grey,
              ),
              SizedBox(height: 10),
              Wrap(
                children: <Widget>[
                  Container(
                    height: 45,
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      leading: Image.asset(
                        "assets/icons/edit.png",
                        width: 25,
                        height: 25,
                      ),
                      title: Text(
                        'Modifier le véhicule',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        // Implement vehicle modification logic here
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    height: 45,
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      leading: Image.asset(
                        "assets/icons/delete.png",
                        width: 26,
                        height: 26,
                      ),
                      title: Text(
                        'Supprimer le véhicule',
                        style: TextStyle(
                          color: AppColors.deleteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        widget.onDismissed(widget.vehicule);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CarInformation(widget: widget);
          },
        );
      },
      child: Container(
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
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.vehicule.marque} - ${widget.vehicule.modele}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                GestureDetector(
                  onTap: _showOptionsDialog,
                  child: Image.asset(
                    'assets/icons/option.png',
                    width: 25,
                    height: 25,
                    color: AppColors.iconColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconTextRow(
                  iconPath: 'assets/icons/speed.png',
                  text: widget.vehicule.kilometrage.toString() ?? '',
                ),
                SizedBox(height: 4),
                // IconTextRow(
                //   iconPath: 'assets/icons/car.png',
                //   text: widget.vehicule.dernierVidange.toString(),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final double width;
  final double height;

  const IconTextRow({
    Key? key,
    required this.iconPath,
    required this.text,
    this.width = 28.0,
    this.height = 28.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 42,
          child: Image.asset(
            iconPath,
            width: width,
            height: height,
            color: AppColors.iconColor,
          ),
        ),
        SizedBox(width: 8),
        Text(text, style: _textStyle),
      ],
    );
  }
}
