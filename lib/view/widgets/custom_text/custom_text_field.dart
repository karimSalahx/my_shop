import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;
  final String Function(String) onValidate;
  final TextInputType textInputType;
  final String labelText;
  final bool obsecureText;
  final String Function(String) onSaved;
  const CustomTextField({
    @required this.textHint,
    @required this.controller,
    @required this.onValidate,
    @required this.textInputType,
    @required this.labelText,
    @required this.obsecureText,
    @required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          textHint,
          style: TextStyle(fontSize: 13, letterSpacing: 1.1),
        ),
        TextFormField(
          style: TextStyle(letterSpacing: 1.3),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: -15),
            hintText: labelText,
            hintStyle: TextStyle(letterSpacing: 1.3, color: Colors.grey),
            fillColor: Colors.white,
          ),
          controller: controller,
          obscureText: obsecureText,
          validator: onValidate,
          onSaved: onSaved,
          keyboardType: textInputType,
        )
      ],
    );
  }
}
