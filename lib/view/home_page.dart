import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/core/viewModel/home_view_model.dart';
import 'package:my_shop/view/cart_page.dart';
import 'package:my_shop/view/explore_page.dart';
import 'package:my_shop/view/user_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        bottomNavigationBar: GetBuilder(
          init: HomeViewModel(),
          builder: (controller) => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Explore'),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/images/explore.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Cart'),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/images/cart.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('User'),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/images/user.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
            elevation: 0,
            currentIndex: controller.currentIndex,
            onTap: controller.onTap,
            backgroundColor: Colors.grey[50],
          ),
        ),
        body: GetBuilder<HomeViewModel>(
          builder: (controller) => controller.currentIndex == 0
              ? ExplorePage()
              : controller.currentIndex == 1
                  ? CartPage()
                  : UserPage(),
        ),
      ),
    );
  }
}
