import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constants.dart';

import '../custom_text.dart';

class ProductListView extends StatelessWidget {
  final List<String> _list = <String>[
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
  ];
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Container(
      height: height * .4,
      child: ListView.separated(
        itemCount: _list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/Image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: 'BeoPlay Speaker',
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: 'Bang and Olufsen',
                    alignment: Alignment.bottomLeft,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: '\$755',
                    alignment: Alignment.bottomLeft,
                    color: Constants.primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        separatorBuilder: (_, __) => SizedBox(width: 20),
      ),
    );
  }
}
