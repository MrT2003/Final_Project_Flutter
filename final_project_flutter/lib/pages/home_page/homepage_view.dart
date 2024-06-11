import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/home_page/controller/home_page_controller.dart';
import 'package:final_project_flutter/pages/home_page/widgets/categories.dart';
import 'package:final_project_flutter/pages/home_page/widgets/home_app_bar.dart';
import 'package:final_project_flutter/pages/home_page/widgets/items_widget.dart';
import 'package:final_project_flutter/pages/home_page/controller/search_controller.dart';
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
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    HomeAppBar(),
                    //Tạo đường viên cong
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Autocomplete<String>(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  //Iterable là gì
                                  return Iterable<String>.empty();
                                }
                                return s.getSuggestions(textEditingValue.text);
                              },
                              onSelected: (String selection) {
                                s.searchProduct(selection);
                                Get.toNamed('/itemPage',
                                    arguments: s.selectedProduct.value);
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                textEditingController.text = s.search.text;
                                textEditingController.addListener(() {
                                  s.search.text = textEditingController.text;
                                });
                                return TextFormField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onFieldSubmitted: (String value) {
                                    s.selectProduct(value);
                                    if (s.selectedProduct.value != null) {
                                      Get.toNamed('/itemPage',
                                          arguments: s.selectedProduct.value);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Search here',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    suffixIcon: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: AppColor.blue,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.black),
                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: ListView.builder(
                                        padding: EdgeInsets.all(0),
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          final product =
                                              s.getProductByTitle(option);
                                          return ListTile(
                                            title: Text(option),
                                            leading: product != null &&
                                                    product['image'] != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.network(
                                                      h.homepageList.firstWhere(
                                                          (element) =>
                                                              element[
                                                                  'title'] ==
                                                              option)['image'],
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  )
                                                : null,
                                            onTap: () {
                                              var selectedProduct = h
                                                  .homepageList
                                                  .firstWhere((element) =>
                                                      element['title'] ==
                                                      option);
                                              Get.toNamed('/itemPage',
                                                  arguments: selectedProduct);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Text('Best Selling',
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                          ItemsWidget(),
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
