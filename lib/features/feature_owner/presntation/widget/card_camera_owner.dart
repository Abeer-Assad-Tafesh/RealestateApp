import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardCameraOwner extends StatelessWidget {
  String image;
  String title;

  CardCameraOwner({
    required this.image,
    required this.title,
  });

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
              color: Colors.grey.shade700,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: 8.w),
            Image.asset(
              image,
              color: Colors.grey.shade700,
              width: 20.w,
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
