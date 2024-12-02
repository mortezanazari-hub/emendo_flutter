import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

DropdownButtonFormField<T> myStyleDropdownButtonFormField<T>({
  bool? isDense = false,
  required T value,
  OutlineInputBorder? inputBorder,
  required ValueChanged<T?> onChanged,
  required List<T> items,
}) {
  inputBorder ??= OutlineInputBorder(
      borderSide: BorderSide(color: AppConst.color3, width: 1),
      borderRadius: BorderRadius.circular(20));
  return DropdownButtonFormField<T>(
    value: value,
    isDense: isDense!,
    decoration: InputDecoration(
        border: inputBorder,
        contentPadding: const EdgeInsets.only(left: 10),
        fillColor: AppConst.color1,
        filled: true,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder),
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
