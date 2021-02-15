import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color textColor;
  final Color backgroundColor;
  const CustomButton({
    @required this.onPressed,
    this.text,
    this.textColor,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(18),
      onPressed: onPressed,
      color: backgroundColor,
      child: CustomText(
        text: text,
        color: textColor,
        alignment: Alignment.center,
      ),
    );
  }
}
