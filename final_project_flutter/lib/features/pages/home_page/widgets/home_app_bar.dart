import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/authetication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      color: AppColor.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(Icons.sort),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Minh Trieu Shop',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Badge(
            // backgroundColor: Colors.yellow,
            label: Text('3'),
            child: InkWell(
              onTap: () => Get.toNamed('cartPage'),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
