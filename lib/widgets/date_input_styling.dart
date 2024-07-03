import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class DateInputStyling extends StatefulWidget {
  const DateInputStyling({
    Key? key,
    required this.label,
    this.icon,
    this.content = '',
    required this.width,
    required this.height,
  }) : super(key: key);

  final String label;
  final String? icon;
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
              color: AppColors.hintColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            prefixIcon: widget.icon != null && widget.icon!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset(
                      'assets/icons/' + widget.icon!,
                      width: widget.width,
                      height: widget.height,
                    ),
                  )
                : null,
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
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
