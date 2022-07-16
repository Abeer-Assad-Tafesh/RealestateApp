import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class ItemRowOwnerDetails extends StatelessWidget {
  String image;
  String title;
  double fontSize;
  // double imageHeight;
  // double imageWidth;
  Color fontColor;
  FontWeight fontWeight;

  ItemRowOwnerDetails({
    required this.image,
    required this.title,
    this.fontSize = 14,
    this.fontColor = Colors.grey,
    this.fontWeight = FontWeight.normal,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 7.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w),
          Image.asset(
            image,
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 15.w),
          Container(
            height: 30.sp,
            alignment: Alignment.bottomCenter,
            child: CustomeText(
              title: title,
              fontSize: fontSize.sp,
              color: fontColor,
              textAlign: TextAlign.center,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
