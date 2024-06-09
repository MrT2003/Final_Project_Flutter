import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_flutter/pages/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomePageController h = Get.put(HomePageController());
    final HomePageController h = Get.find<HomePageController>();

    return Obx(() {
      // if (h.isLoading.value) {
      // return Center(
      //   child: CircularProgressIndicator(),
      // );
      // } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 1; i < 8; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: h.homepageList[i]['image'],
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons
                          .error), // Widget hiển thị khi xảy ra lỗi khi tải hình ảnh
                      width: 40, // Độ rộng của ảnh
                      height: 40, // Độ cao của ảnh
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    }
        // },
        );
  }
}
