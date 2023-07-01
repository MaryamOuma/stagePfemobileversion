import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../shared/theme.dart';

class BannerPlayerWidgets extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? buttonColor;
  final String? background;
  const BannerPlayerWidgets({
    this.title,
    this.subtitle,
    this.buttonColor,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${background}'),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    '${title}',
                    style: bold.copyWith(
                      fontSize: 18,
                      color: buttonColor == 'dark' ? black : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    '${subtitle}',
                    style: medium.copyWith(
                      fontSize: 11,
                      color: buttonColor == 'dark' ? black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: buttonColor == 'dark' ? black : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: buttonColor == 'dark' ? Colors.white : black,
            ),
          )
        ],
      ),
    );
  }
}
