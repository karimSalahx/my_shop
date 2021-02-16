import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_shop/core/viewModel/auth_view_model.dart';
import 'package:my_shop/view/auth/login_screen.dart';
import 'package:my_shop/view/home_page.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        (Get.find<AuthViewModel>().user != null) ? HomePage() : LoginScreen());
  }
}
