import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/home_page/controller/home_page_controller.dart';
import 'package:final_project_flutter/features/pages/home_page/widgets/autocomplete_search.dart';
import 'package:final_project_flutter/features/pages/home_page/widgets/categories.dart';
import 'package:final_project_flutter/features/pages/home_page/widgets/home_app_bar.dart';
import 'package:final_project_flutter/features/pages/home_page/widgets/items_widget.dart';
import 'package:final_project_flutter/features/pages/home_page/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  final HomePageController h = Get.put(HomePageController());
  final SearchController_2 s = Get.put(SearchController_2());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (h.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeAppBar(),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      decoration: const BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: [
                          SearchAutocomplete(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Categories',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const CategoriesWidget(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Text('Best Selling',
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                          const ItemsWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
