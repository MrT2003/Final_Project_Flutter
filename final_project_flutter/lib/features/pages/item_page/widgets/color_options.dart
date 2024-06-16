import 'package:flutter/material.dart';

class ColorOptions extends StatelessWidget {
  final List<Color> Clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
  ];
  ColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            'Color: ',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              for (int i = 0; i < Clrs.length; i++)
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Clrs[i],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
