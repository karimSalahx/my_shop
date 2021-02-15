import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  final Function onPressed;
  const CustomSocialButton(
      {@required this.buttonText,
      @required this.imagePath,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            onPressed: null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imagePath),
                CustomText(
                  text: buttonText,
                  alignment: Alignment.center,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ],
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
