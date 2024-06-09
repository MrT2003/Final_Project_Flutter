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
              return
                  // Expanded(
                  //   /*Tại sao lại dùng expand ở đây */
                  //   child:
                  SingleChildScrollView(
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
                                  return const Iterable<String>.empty();
                                }
                                return s.getSuggestions(textEditingValue.text);
                              },
                              onSelected: (String selection) {
                                s.searchProduct(selection);
                                s.search.text = selection;
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: s.search,
                                  focusNode: focusNode,
                                  onFieldSubmitted: (value) {
                                    s.searchProduct(value);
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final String option =
                                            options.elementAt(index);
                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: ListTile(
                                            title: Text(option),
                                          ),
                                        );
                                      },
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
                // ),
              );
            }
          },
        ),
      ),
    );
  }
}
