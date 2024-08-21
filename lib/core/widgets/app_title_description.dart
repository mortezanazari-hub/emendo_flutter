import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class AppTitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const AppTitleDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:AppConst.standardPadding ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: AppConst.standardPadding * 0.1),
          Text(description,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppConst.disabledColor)),
        ],
      ),
    );
  }
}
