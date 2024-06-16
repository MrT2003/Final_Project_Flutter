import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/item_page/widgets/ratings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final String title;
  final String description;
  const ItemDetail({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 20,
          ),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 30),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        Ratings(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall,
            // TextStyle(
            //   color: AppColor.blue,
            //   fontSize: 17,
            // ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
