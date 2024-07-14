import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

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
                  primary: AppColors.kPrimaryColor,
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
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.label,
            labelStyle: TextStyle(
              color: AppColors.hintColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: (53 - widget.height) / 2),
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
            fontSize: 15,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.label} obligatoire';
            }
            return null;
          },
        ),
      ),
    );
  }
}
