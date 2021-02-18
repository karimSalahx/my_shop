import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/view/widgets/custom_text/custom_button.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthViewModel controller = Get.find<AuthViewModel>();
    double height = Get.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
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
                  CustomText(
                    text: 'Sign Up,',
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  CustomTextField(
                    onSaved: (value) => controller.name = value,
                    onValidate: (value) {
                      if (value.length == 0) {
                        return 'Please Enter Your name';
                      }
                      return null;
                    },
                    textHint: 'Name',
                    textInputType: TextInputType.name,
                    obsecureText: false,
                    labelText: 'Mohamed Salah',
                  ),
                  SizedBox(
                    height: height * .05,
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
                    height: height * .1,
                  ),
                  CustomButton(
                    onPressed: () {
                      // Calls on Save method
                      _formKey.currentState.save();

                      if (_formKey.currentState.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    backgroundColor: Constants.primaryColor,
                    text: 'SIGN UP',
                    textColor: Colors.white,
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
