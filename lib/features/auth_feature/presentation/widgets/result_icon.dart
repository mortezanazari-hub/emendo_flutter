import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class ResultIcon extends StatefulWidget {
  final double size;
  final Color color;

  const ResultIcon({required this.size, required this.color, super.key});

  @override
  State<ResultIcon> createState() => _ResultIconState();
}

class _ResultIconState extends State<ResultIcon> {

  @override
  Widget build(BuildContext context) {
    final halfSize = widget.size / 2;
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(halfSize),
          color: const Color(0xffe0e8de),
        ),
        child: Center(
          child: SizedBox(
            width: widget.size * 0.8,
            height: widget.size * 0.8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(halfSize),
                color: widget.color,
              ),
              child: Icon(
                Icons.mail_lock,
                size: widget.size * 0.3,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
