import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project_flutter/features/pages/home_page/controller/search_controller.dart';
import 'package:final_project_flutter/core/colors/color.dart';

class SearchAutocomplete extends StatelessWidget {
  final SearchController_2 searchController = Get.find<SearchController_2>();

  SearchAutocomplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }
          return searchController.getSuggestions(textEditingValue.text);
        },
        onSelected: (String selection) {
          searchController.searchProduct(selection);
          Get.toNamed('/itemPage',
              arguments: searchController.selectedProduct.value);
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          textEditingController.text = searchController.search.text;
          textEditingController.addListener(() {
            searchController.search.text = textEditingController.text;
          });
          return TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (String value) {
              searchController.selectProduct(value);
              if (searchController.selectedProduct.value != null) {
                Get.toNamed('/itemPage',
                    arguments: searchController.selectedProduct.value);
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
                margin: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(
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
                width: MediaQuery.of(context).size.width - 30,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    final product = searchController.getProductByTitle(option);
                    return ListTile(
                      title: Text(option),
                      leading: product != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.network(
                                product.image,
                                height: 40,
                                width: 40,
                                fit: BoxFit.contain,
                              ),
                            )
                          : null,
                      onTap: () {
                        var selectedProduct =
                            searchController.getProductByTitle(option);
                        if (selectedProduct != null) {
                          Get.toNamed('/itemPage',
                              arguments: selectedProduct.toJson());
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
