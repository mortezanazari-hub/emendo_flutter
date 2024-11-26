import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class ContainerWithLabel extends StatelessWidget {
  final String label;
  final Widget child;

  const ContainerWithLabel({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppConst.color2),
              borderRadius: BorderRadius.circular(20)),
          child: child,
        ),
        Positioned(
          top: -8,
          left: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: AppConst.color0,
            child: Text(
              label,
              style: TextStyle(
                color: AppConst.color5,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
