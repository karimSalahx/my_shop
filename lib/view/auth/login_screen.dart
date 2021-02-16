import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/view/widgets/custom_text/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text/custom_social_button.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          key: _formKey,
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
                    onValidate: (value) {
                      if (value.length == 0) {
                        return 'Please Enter your email Adress';
                      }
                      return null;
                    },
                    onSaved: (value) => controller.email = value,
                    textHint: 'Email',
                    textInputType: TextInputType.emailAddress,
                    obsecureText: false,
                    labelText: 'iamdavid@gmail.com',
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                    onSaved: (value) => controller.password = value,
                    onValidate: (value) {
                      if (value.length == 0) {
                        return 'Please Enter Password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    textHint: 'Password',
                    textInputType: TextInputType.name,
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
                    onPressed: () {
                      // Calls on Save method
                      _formKey.currentState.save();

                      if (_formKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
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
                    onPressed: () => controller.facebookSignIn(),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  CustomSocialButton(
                    buttonText: 'Sign In with Google',
                    imagePath: 'assets/images/google.png',
                    onPressed: () => controller.googleSignIn(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
