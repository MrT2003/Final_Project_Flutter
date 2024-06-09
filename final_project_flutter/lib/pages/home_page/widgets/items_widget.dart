import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomePageController h = Get.put(HomePageController());
    final HomePageController h = Get.find<HomePageController>();

    // return Obx(
    //   () {
    // if (h.isLoading.value) {
    // return Center(
    //   child: CircularProgressIndicator(),
    // );
    // } else {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 14; i < h.homepageList.length; i++)
          Container(
            // height: 250,
            /*Card*/
            margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '-50%',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: AppColor.red,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Get.toNamed('/itemPage', arguments: {
                    'image': h.homepageList[i]['image'].toString(),
                    'title': h.homepageList[i]['title'].toString(),
                    'description': h.homepageList[i]['description'].toString(),
                    'price': h.homepageList[i]['price'].toString(),
                  }),
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: h.homepageList[i]['image'],
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons
                          .error), // Widget hiển thị khi xảy ra lỗi khi tải hình ảnh
                      width: 120, // Độ rộng của ảnh
                      height: 120, // Độ cao của ảnh
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    h.homepageList[i]['title'],
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 18),
                    maxLines: 2,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${h.homepageList[i]['price'].toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 17),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: AppColor.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
    // }
    // },
    // );
  }
}
