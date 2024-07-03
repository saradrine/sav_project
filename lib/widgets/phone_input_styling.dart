import 'package:flutter/material.dart';
import 'package:sav_project/widgets/profile_form.dart';

class PhoneInputStyling extends StatefulWidget {
  const PhoneInputStyling({
    Key? key,
    required this.label,
    required this.icon,
    required this.content,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String label;
  final String icon;
  final String content;
  final double width;
  final double height;

  @override
  _PhoneInputStylingState createState() => _PhoneInputStylingState();
}

class _PhoneInputStylingState extends State<PhoneInputStyling> {
  List<String> phoneNumbers = [];

  @override
  void initState() {
    super.initState();
    phoneNumbers.add(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextInputStyling(
                label: widget.label,
                icon: widget.icon,
                width: widget.width,
                height: widget.height,
                content: phoneNumbers.first,
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        ...phoneNumbers.skip(1).map((phone) => Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: TextFormField(
                        initialValue: phone,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Téléphone...',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Divider(
            color: Colors.grey,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                phoneNumbers.add('');
              });
            },
            icon: Icon(Icons.add, color: Colors.grey),
            label: Text(
              'Ajouter numéro de téléphone',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}

