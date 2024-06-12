import 'package:final_project_flutter/core/colors/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
