import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text.dart';
import 'package:my_shop/view/widgets/custom_text/home_page_widgets/category_list_view.dart';
import 'package:my_shop/view/widgets/custom_text/home_page_widgets/product_list_view.dart';
import 'package:my_shop/view/widgets/custom_text/home_page_widgets/search_text_form.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Container(
      padding: EdgeInsets.only(top: 100, right: 20, left: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextForm(),
            SizedBox(
              height: height * .03,
            ),
            CustomText(
              text: 'Categories',
              fontSize: 16,
            ),
            SizedBox(
              height: height * .03,
            ),
            CategoryListView(),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Best Selling',
                  fontSize: 18,
                ),
                CustomText(text: 'See All'),
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            ProductListView(),
          ],
        ),
      ),
    );
  }
}
