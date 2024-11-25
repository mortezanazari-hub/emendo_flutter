import 'package:flutter/material.dart';

import 'app_const.dart';

enum FilterSearch { all, noDate, today, tomorrow, past, future }

class FilterButton extends StatelessWidget {
  final FilterSearch initialFilter;
  final Function(FilterSearch) onFilterSelected;

  const FilterButton({
    Key? key,
    required this.initialFilter,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FilterSearch.values.length,
        itemBuilder: (context, index) {
          final value = FilterSearch.values[index];
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              onPressed: () => onFilterSelected(value),
              style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    //color: value == initialFilter ? Colors.red : Colors.blue,
                  ),
                ),
                overlayColor: WidgetStatePropertyAll(AppConst.color2),
                shadowColor: WidgetStatePropertyAll(AppConst.color4),
                foregroundColor: WidgetStatePropertyAll(
                  value == initialFilter ? AppConst.color7 : AppConst.color6,
                ),
                backgroundColor: WidgetStatePropertyAll(
                    value == initialFilter ? AppConst.color3 : AppConst.color1),
                padding: WidgetStateProperty.all(EdgeInsets.all(3)),
              ),
              // ElevatedButton.styleFrom(backgroundColor: value == initialFilter ? AppConst.mainColor : null,),
              child: Text(value.toString().split('.').last),
            ),
          );
        },
      ),
    );
  }
}
