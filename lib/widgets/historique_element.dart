import 'package:flutter/material.dart';
import 'package:sav_project/models/historiqueRDV.dart';

class HistoriqueElement extends StatefulWidget {
  final Historiquerdv historique;
  final Function(Historiquerdv) onDismissed;

  const HistoriqueElement({
    Key? key,
    required this.historique,
    required this.onDismissed,
  }) : super(key: key);

  @override
  State<HistoriqueElement> createState() => _HistoriqueElementState();
}

class _HistoriqueElementState extends State<HistoriqueElement> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.historique.hashCode.toString()),
      onDismissed: (direction) => widget.onDismissed(widget.historique),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 185, 11, 0),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/delete.png'),
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Supprimer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 7),
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "${widget.historique.type}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.historique.state,
                  style: TextStyle(
                    color: widget.historique.state == "Accepté"
                        ? Color(0xFF039388)
                        : widget.historique.state == "Refusé"
                            ? Color(0xFFB90B00)
                            : widget.historique.state == "En cours"
                                ? Color(0xFFCFAE00)
                                : Color(0xFF989898),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Véhicule:  ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '${widget.historique.marque} - ${widget.historique.modele}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0, left: 90.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.historique.immatriculation,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Le ${widget.historique.date.day}/${widget.historique.date.month}/${widget.historique.date.year} à ${widget.historique.date.hour}:${widget.historique.date.minute}',
                    style: TextStyle(
                      color: Color(0xFF989898),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
