import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/home_page/widgets/categories.dart';
import 'package:final_project_flutter/pages/home_page/widgets/home_app_bar.dart';
import 'package:final_project_flutter/pages/home_page/widgets/items_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            HomeAppBar(),
            // Search Widget
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 280,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search here',
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => null,
                          icon: Icon(
                            Icons.camera_alt,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  // Categories Widget
                  CategoriesWidget(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text('Best Selling',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  ItemsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
