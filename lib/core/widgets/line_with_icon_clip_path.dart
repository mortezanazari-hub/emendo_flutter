import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class LineWithIcon extends StatelessWidget {
  final Color? lineColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? lineWidth;
  final double? iconSize;
  final IconData? icon;
  final Function()? onTap;

  const LineWithIcon(
      {super.key,
      this.lineColor,
      this.lineWidth,
      this.iconSize,
      this.icon,
      this.onTap,
      this.iconColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: lineWidth ?? 2,
                  color: lineColor ?? AppConst.color3,
                ),
              )
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: onTap ?? () {},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor ?? AppConst.color2,
                border: Border.all(
                  width: lineWidth ?? 2,
                  color: lineColor ?? AppConst.color3,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Icon(
                icon ?? Icons.add,
                size: iconSize ?? 24,
                color: iconColor ?? AppConst.color5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
