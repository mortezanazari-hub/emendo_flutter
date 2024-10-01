import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstAuthWidget extends StatelessWidget {
  final String svgPath, title, des;

  const FirstAuthWidget(
      {required this.svgPath,
      required this.title,
      required this.des,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            svgPath,
            height: AppConst.screenHeight * 0.35,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              des,
              style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          const Spacer(),
        ],
      ),
    );
  }
}
