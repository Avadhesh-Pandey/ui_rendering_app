import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'subwidgets/box_list_item.dart';
import 'subwidgets/circular_list_item.dart';

class HorizontalListWidget extends StatelessWidget {
  final List<dynamic> listItems;
  final String? title;

  const HorizontalListWidget({super.key, required this.listItems,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title??"",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
          SizedBox(
            height: 160.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: listItems.map((e) {
                if (e["type"] == "box_item") {
                  return BoxItemWidget(e);
                } else {
                  return CircularItemWidget(e);
                }
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
