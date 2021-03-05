import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/view/widgets/custom_text/custom_text.dart';

class CategoryListView extends StatelessWidget {
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
      height: height * .1,
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
              child: Image.asset('assets/images/shoes.png'),
            ),
            SizedBox(
              height: height * .01,
            ),
            CustomText(text: _list[i])
          ],
        ),
        separatorBuilder: (_, __) => SizedBox(width: 20),
      ),
    );
  }
}
