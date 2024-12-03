import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class MyStyleDropdownButtonFormField<T> extends StatelessWidget {
  final bool? isDense;
  final T value;
  final OutlineInputBorder? inputBorder;
  final ValueChanged<T?> onChanged;
  final List<T> items;
  final bool? isExpanded;

  const MyStyleDropdownButtonFormField({
    super.key,
    this.isDense = false,
    required this.value,
    this.inputBorder,
    required this.onChanged,
    required this.items,
    this.isExpanded = true,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final effectiveInputBorder = inputBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(color: AppConst.color3, width: 1),
          borderRadius: BorderRadius.circular(20),
        );

    return DropdownButtonFormField<T>(
      isExpanded: isExpanded!,
      value: value,
      menuMaxHeight: 350,
      decoration: InputDecoration(
        // isDense: isDense!,
        constraints: BoxConstraints(minWidth: 100, maxWidth: 120),
        border: effectiveInputBorder,
        contentPadding: const EdgeInsets.only(left: 10),
        fillColor: AppConst.color1,
        filled: true,
        focusedBorder: effectiveInputBorder,
        enabledBorder: effectiveInputBorder,
      ),
      style: TextStyle(color: AppConst.color6),
      onChanged: onChanged,
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              ))
          .toList(),
    );
  }
}
