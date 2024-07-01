import 'package:flutter/material.dart';
import 'package:sav_project/widgets/button.dart';

class ProfileFieldDetail {
  final String label;
  final String icon;
  final double height;
  final double width;
  final WidgetType widgetType;
  final String content;

  ProfileFieldDetail({
    required this.label,
    this.icon = '',
    this.height = 30,
    this.width = 30,
    required this.widgetType,
    required this.content,
  });
}

enum WidgetType { TextInputStyling, PhoneInputStyling, DateInputStyling }

class ProfileForm extends StatefulWidget {
  final List<ProfileFieldDetail> fields;

  ProfileForm({required this.fields});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 20),
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
              height: 25,
            ),
            ...List.generate(widget.fields.length * 2 - 1, (index) {
              if (index % 2 == 0) {
                final field = widget.fields[index ~/ 2];
                return ProfileFieldInput(
                  label: field.label,
                  icon: field.icon,
                  height: field.height,
                  width: field.width,
                  widgetType: field.widgetType,
                  content: field.content,
                );
              } else {
                return SizedBox(height: 15);
              }
            }),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileFieldInput extends StatelessWidget {
  const ProfileFieldInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.height,
    required this.width,
    required this.widgetType,
    required this.content,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final WidgetType widgetType;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
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
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: widgetType == WidgetType.TextInputStyling
            ? TextInputStyling(
                label: label,
                icon: icon,
                height: height,
                width: width,
                content: content,
                keyboardType: TextInputType.text,
              )
            : widgetType == WidgetType.PhoneInputStyling
                ? PhoneInputStyling(
                    label: label,
                    icon: icon,
                    content: content,
                    width: width,
                    height: height,
                  )
                : DateInputStyling(
                    label: label,
                    icon: icon,
                    content: content,
                    width: width,
                    height: height,
                  ),
      ),
    );
  }
}

class TextInputStyling extends StatelessWidget {
  const TextInputStyling({
    Key? key,
    required this.label,
    required this.icon,
    required this.height,
    required this.width,
    required this.content,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final String content;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: content,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            'assets/icons/' + icon,
            width: width,
            height: height,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }
}

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

class DateInputStyling extends StatefulWidget {
  const DateInputStyling({
    Key? key,
    required this.label,
    required this.icon,
    this.content = '',
    required this.width,
    required this.height,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final String content;

  @override
  _DateInputStylingState createState() => _DateInputStylingState();
}

class _DateInputStylingState extends State<DateInputStyling> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                dividerTheme: DividerThemeData(
                  color: Colors.grey,
                  space: 1,
                  thickness: 1,
                ),
                colorScheme: ColorScheme.light(
                  primary: Color(0xFF039388),
                  onPrimary: Colors.white,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          setState(() {
            _controller.text = "${pickedDate.toLocal()}".split(' ')[0];
          });
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/icons/' + widget.icon,
                width: widget.width,
                height: widget.height,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.label} is required';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class TimeInputStyling extends StatefulWidget {
  const TimeInputStyling({
    Key? key,
    required this.label,
    required this.icon,
    this.content = '',
    required this.width,
    required this.height,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final String content;

  @override
  _TimeInputStylingState createState() => _TimeInputStylingState();
}

class _TimeInputStylingState extends State<TimeInputStyling> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                dividerTheme: DividerThemeData(
                  color: Colors.grey,
                  space: 1,
                  thickness: 1,
                ),
                colorScheme: ColorScheme.light(
                  primary: Color(0xFF039388),
                  onPrimary: Colors.white,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedTime != null) {
          setState(() {
            _controller.text = pickedTime.format(context);
          });
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/icons/' + widget.icon,
                width: widget.width,
                height: widget.height,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.label} is required';
            }
            return null;
          },
        ),
      ),
    );
  }
}
