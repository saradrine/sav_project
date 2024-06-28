import 'package:flutter/material.dart';
import 'package:sav_project/widgets/button.dart';

class FieldDetail {
  final String label;
  final String icon;
  final double height;
  final double width;
  final WidgetType widgetType;
  final List<String> items;

  FieldDetail(
      {required this.label,
      required this.icon,
      this.height = 30,
      this.width = 30,
      required this.widgetType,
      this.items = const []});
}

class FormWidget extends StatefulWidget {
  final List<FieldDetail> fields;

  const FormWidget({super.key, required this.fields});

  @override
  FormWidgetState createState() {
    return FormWidgetState();
  }
}

class FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.fields.length * 2 - 1, (index) {
              if (index % 2 == 0) {
                final field = widget.fields[index ~/ 2];
                return FieldInput(
                  label: field.label,
                  icon: field.icon,
                  height: field.height,
                  width: field.width,
                  widgetType: field.widgetType,
                  items: field.items,
                );
              } else {
                return SizedBox(height: 30);
              }
            }),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonStyled(
                      formKey: _formKey,
                      textColor: Colors.white,
                      backgroundColor: Color(0xFF039388),
                      text: 'Sauvegarder'),
                  SizedBox(
                    width: 15,
                  ),
                  ButtonStyled(
                      formKey: _formKey,
                      textColor: Color(0xFF039388),
                      backgroundColor: Color(0xFFEEF0F3),
                      text: 'Annuler'),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

enum WidgetType { TextInputStyling, DropDownInputStyling }

class FieldInput extends StatelessWidget {
  const FieldInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.height,
    required this.width,
    required this.widgetType,
    this.items = const [],
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final WidgetType widgetType;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.85,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: widgetType == WidgetType.TextInputStyling
              ? TextInputStyling(
                  icon: icon, height: height, width: width, label: label)
              : DropDownInputStyling(
                  icon: icon,
                  height: height,
                  width: width,
                  label: label,
                  items: items),
        ),
      ],
    );
  }
}

class DropDownInputStyling extends StatelessWidget {
  const DropDownInputStyling({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
    required this.label,
    required this.items,
  });

  final String icon;
  final double height;
  final double width;
  final String label;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Image.asset(
          'assets/icons/down.png',
          width: 35,
          height: 35,
        ),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // setState(() {
        //   _selectedValue = newValue!;
        // });
      },
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "Choisis le $label",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            'assets/icons/' + icon,
            width: width,
            height: height,
          ),
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: (60 - height) / 2),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return label + 'is required';
        }
        return null;
      },
      // onSaved: (String value) {
      //   _marque = value;
      // },
    );
  }
}

class TextInputStyling extends StatelessWidget {
  const TextInputStyling({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
    required this.label,
  });

  final String icon;
  final double height;
  final double width;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "$label...",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            'assets/icons/' + icon,
            width: width,
            height: height,
          ),
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: (60 - height) / 2),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return label + 'is required';
        }
        return null;
      },
      // onSaved: (String value) {
      //   _marque = value;
      // },
    );
  }
}
