import 'package:flutter/material.dart';
import 'package:sav_project/widgets/drop_down_input_styling.dart';
import 'package:sav_project/widgets/password_input_styling.dart';
import 'package:sav_project/widgets/text_input_styling.dart'
    as TextInputStyling;

import 'date_input_styling.dart';
import 'time_input_styling.dart';

class FieldDetail {
  final String label;
  final String icon;
  final double height;
  final double width;
  final WidgetType widgetType;
  final List<String> items;

  FieldDetail(
      {required this.label,
      this.icon = '',
      this.height = 30,
      this.width = 30,
      required this.widgetType,
      this.items = const []});
}

enum WidgetType {
  TextInputStyling,
  DropDownInputStyling,
  PasswordInputStyling,
  DateInputStyling,
  TimeInputStyling,
}

class FieldInput extends StatefulWidget {
  const FieldInput({
    Key? key,
    required this.label,
    this.icon = '',
    this.height = 30,
    this.width = 30,
    required this.widgetType,
    this.items = const [],
    this.borderRadius = 20.0,
    this.applyBoxShadow = true,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final WidgetType widgetType;
  final List<String> items;
  final double borderRadius;
  final bool applyBoxShadow;

  @override
  State<FieldInput> createState() => _FieldInputState();
}

class _FieldInputState extends State<FieldInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            '${widget.label}:',
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
            boxShadow: widget.applyBoxShadow
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: Colors.white,
          ),
          child: widget.widgetType == WidgetType.TextInputStyling
              ? TextInputStyling.TextInputStyling(
                  icon: widget.icon,
                  height: widget.height,
                  width: widget.width,
                  label: widget.label,
                )
              : widget.widgetType == WidgetType.DropDownInputStyling
                  ? CustomDropdown(
                      icon: widget.icon,
                      height: widget.height,
                      width: widget.width,
                      label: widget.label,
                      items: widget.items,
                    )
                  : widget.widgetType == WidgetType.PasswordInputStyling
                      ? PasswordInputStyling(
                          label: widget.label,
                        )
                      : widget.widgetType == WidgetType.DateInputStyling
                          ? DateInputStyling(
                              label: widget.label,
                              icon: widget.icon,
                              width: widget.width,
                              height: widget.height,
                            )
                          : TimeInputStyling(
                              label: widget.label,
                              icon: widget.icon,
                              width: widget.width,
                              height: widget.height,
                            ),
        ),
      ],
    );
  }
}
