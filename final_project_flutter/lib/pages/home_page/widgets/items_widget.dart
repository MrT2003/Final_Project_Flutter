import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/favourite_page/favourite_controller.dart';
import 'package:final_project_flutter/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController h = Get.put(HomePageController());

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: h.homepageList.length > 6 ? 6 : h.homepageList.length,
      itemBuilder: (context, index) {
        final product = h.homepageList[index];
        // final productCart = h.cartList[index];
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(right: 10, left: 10),
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
                  Obx(() {
                    bool isFavourite = h.isProductInFavorites(product);
                    return IconButton(
                      icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite ? Colors.red : null,
                      ),
                      onPressed: () {
                        if (isFavourite) {
                          h.removeProductFromFavourite(product);
                        } else {
                          h.addProductToFavourite(product);
                        }
                      },
                    );
                  })
                ],
              ),
              InkWell(
                onTap: () => Get.toNamed('/itemPage', arguments: {
                  'image': product.image,
                  'title': product.title,
                  'description': product.description,
                  'price': product.price.toString(),
                }),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 5.0),
              //   child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 17),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_checkout,
                      color: AppColor.blue,
                    ),
                    onPressed: () => h.addProductToCart(product),
                  )
                ],
              ),
              // )
            ],
          ),
        );
      },
    );
  }
}
