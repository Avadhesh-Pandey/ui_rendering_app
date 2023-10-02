import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxItemWidget extends StatelessWidget{
  final Map<String, dynamic> item;
  const BoxItemWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:20.h,bottom: 16.h,right: 12.w,left: 12.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0.r),
                child: Image.network(
                  item['image'],
                  width: 80.r,
                  height: 80.r,
                  fit: BoxFit.cover,
                  errorBuilder: (context,object,stackTrace){
                    return const Icon(Icons.broken_image_outlined,size: 50,);
                  },
                ),
              ),
            ),
            Text(item["text"] ?? "",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp))
          ],
        ),
      ),
    );
  }

}