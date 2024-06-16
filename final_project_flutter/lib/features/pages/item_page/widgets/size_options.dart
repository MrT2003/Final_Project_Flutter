import 'package:flutter/material.dart';

class SizeOptions extends StatelessWidget {
  const SizeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            'Size: ',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              for (int i = 5; i < 10; i++)
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ]),
                  child: Text(
                    i.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 18),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
