import 'package:clippy_flutter/arc.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/color_options.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/item_app_bar.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/item_bottom_nav_bar.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/item_detail.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/item_image.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/ratings.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/size_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ItemPage extends StatelessWidget {
  final List<Color> Clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
  ];

  ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? product = Get.arguments;

    if (product == null) {
      return Scaffold(
        body: Center(
          child: Text('No product data available.'),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: ListView(
          children: [
            ItemAppBar(),
            /*Check */
            ItemImage(imageUrl: product['image']),
            /*Fix */
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ItemDetail(
                        title: product['title'],
                        description: product['description'],
                      ),
                      SizeOptions(),
                      ColorOptions(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ItemBottomNavBar(),
      ),
    );
  }
}
