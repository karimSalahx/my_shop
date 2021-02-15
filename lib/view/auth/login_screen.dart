import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/view/widgets/custom_text/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text/custom_social_button.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Welcome,',
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      CustomText(
                        text: 'Sign Up',
                        color: Constants.primaryColor,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  CustomTextField(
                    onValidate: (value) {},
                    onSaved: (value) {},
                    textHint: 'Email',
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    obsecureText: false,
                    labelText: 'iamdavid@gmail.com',
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                    onSaved: (value) {},
                    onValidate: (value) {},
                    textHint: 'Password',
                    textInputType: TextInputType.name,
                    controller: _passwordController,
                    obsecureText: true,
                    labelText: '******',
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  CustomButton(
                    onPressed: () {},
                    backgroundColor: Constants.primaryColor,
                    text: 'SIGN IN',
                    textColor: Colors.white,
                  ),
                  CustomText(
                    text: '-OR-',
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  CustomSocialButton(
                      buttonText: 'Sign In with Facebook',
                      imagePath: 'assets/images/facebook.png',
                      onPressed: () {}),
                  SizedBox(
                    height: height * .01,
                  ),
                  CustomSocialButton(
                      buttonText: 'Sign In with Google',
                      imagePath: 'assets/images/google.png',
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
