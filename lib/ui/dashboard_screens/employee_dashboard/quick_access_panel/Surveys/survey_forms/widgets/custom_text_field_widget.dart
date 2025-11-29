import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? child;
  final bool obsureText;
  final String? hintText;
  final String? lebelText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isDatePicker; // add this to toggle date picker

  const CustomTextField({
    this.obsureText = false,
    this.lebelText,
    super.key,
    this.controller,
    this.hintText,
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
  String currentValue = "";

  @override
  Widget build(BuildContext context, {String? value}) {
    // ignore: deprecated_member_use
    final isUrdu = RegExp(r'[\u0600-\u06FF]').hasMatch(value ?? '');

    return TextFormField(
      // style: TextStyle(fontFamily: 'urdu_font'),
      obscureText: widget.obsureText,
      style: TextStyle(
        // ignore: deprecated_member_use
        fontFamily: RegExp(r'[\u0600-\u06FF]').hasMatch(widget.controller!.text)
            ? 'urdu_font' // your Urdu font
            : 'english_font', // your English font
      ),
      // textDirection: TextDirection.rtl,
      textDirection: isUrdu ? TextDirection.rtl : TextDirection.ltr,
      textAlign: isUrdu ? TextAlign.right : TextAlign.left,
      controller: widget.controller,
      readOnly: widget.isDatePicker, // only read-only if date picker
      keyboardType: widget.keyboardType,
      onChanged: (val) {
        setState(() {
          currentValue = val;
        });
      },
      decoration: InputDecoration(
        labelText: widget.lebelText,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.cardBorderColor, width: 1.5),
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
