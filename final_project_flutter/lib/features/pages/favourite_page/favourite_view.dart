import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_flutter/features/pages/favourite_page/favourite_controller.dart';
import 'package:final_project_flutter/features/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteView extends StatelessWidget {
  final FavouriteController favouriteController =
      Get.put(FavouriteController());
  final HomePageController home = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: home.favouriteList.length,
            itemBuilder: (context, index) {
              final product = home.favouriteList[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 50,
                  height: 50,
                ),
                title: Text(product.title),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => home.removeProductFromFavourite(product),
                ),
              );
            });
      }),
    );
  }
}
