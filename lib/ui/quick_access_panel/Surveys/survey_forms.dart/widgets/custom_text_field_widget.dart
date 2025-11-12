import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? child;
  final String hintText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isDatePicker; // add this to toggle date picker

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isDatePicker = false, // default false
    this.child,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.isDatePicker, // only read-only if date picker
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
        ),
        suffixIcon: widget.isDatePicker
            ? IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final List<DateTime?>? result = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(calendarType: CalendarDatePicker2Type.single),
                    dialogSize: const Size(350, 400),
                    borderRadius: BorderRadius.circular(10),
                    value: [],
                  );

                  if (result != null && result.isNotEmpty && result[0] != null) {
                    final pickedDate = result[0]!;
                    setState(() {
                      widget.controller?.text =
                          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    });
                  }
                },
              )
            : (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
      ),
      validator: widget.validator,
    );
  }
}
