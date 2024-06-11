import 'package:clippy_flutter/arc.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/item_page/widgets/item_app_bar.dart';
import 'package:final_project_flutter/pages/item_page/widgets/item_bottom_nav_bar.dart';
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                product['image'],
                height: 300,
              ),
            ),
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                product['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 30),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, index) => Icon(
                                Icons.favorite,
                                color: AppColor.blue,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0, 3)),
                                    ],
                                  ),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    color: AppColor.blue,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    '01',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0, 3)),
                                    ],
                                  ),
                                  child: Icon(
                                    CupertinoIcons.add,
                                    color: AppColor.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          product['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 17,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Size: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 5; i < 10; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          ),
                                        ]),
                                    child: Text(
                                      i.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(fontSize: 18),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Color: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < Clrs.length; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: Clrs[i],
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          ),
                                        ]),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
