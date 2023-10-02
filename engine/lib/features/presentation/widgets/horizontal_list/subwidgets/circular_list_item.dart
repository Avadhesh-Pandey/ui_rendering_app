import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularItemWidget extends StatelessWidget{
  final Map<String, dynamic> item;
  const CircularItemWidget(this.item, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 4,
            shape: const CircleBorder(),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 47.r,
                backgroundImage: NetworkImage(item["image"]),
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Text(item["text"] ?? "",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp))
        ],
      ),
    );
  }

}