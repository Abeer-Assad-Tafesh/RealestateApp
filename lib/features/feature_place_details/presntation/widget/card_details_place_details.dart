import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardDetailsPlaceDetails extends StatelessWidget {
  String image;
  String title;

  CardDetailsPlaceDetails({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Row(
          children: [
            Image.asset(image,width: 20.w,height: 20.h,),
            SizedBox(width: 7.w),
            CustomeText(
              title: title,
              color: Colors.black.withOpacity(0.4),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              maxLines: 1,
              overflow: 1,
            ),
          ],
        ),
      ),
    );
  }
}
