import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final Colorstyle colorstyle;
  final Function(String) onChanged;

  CustomTextField({
    required this.controller,
    required this.labelText,
    required this.obscureText,
    required this.colorstyle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            alignLabelWithHint: true,
            hintStyle: Fontstyle.normalStyle,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 6.0,
              ),
            ),
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            floatingLabelAlignment: FloatingLabelAlignment.start,
          ),
          obscureText: obscureText,
          textAlign: TextAlign.right,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
