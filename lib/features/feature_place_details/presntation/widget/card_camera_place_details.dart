import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardCameraPlaceDetails extends StatelessWidget {
  String image;
  String title;
  Color color;
  var space;

  CardCameraPlaceDetails({this.space = 4.0,
    required this.image,
    required this.title,
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomeText(
              title: title,
              color: color,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: space),
            Image.asset(
              image,
              width: 25.w,
              height: 25.h,
              color: color,
            ),
            SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}
