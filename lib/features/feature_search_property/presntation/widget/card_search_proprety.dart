import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardSearchProperty extends StatelessWidget {
  String image;
  String title;
  GestureTapCallback? pressCard;
  Color color;
  double? widthImage;
  double? heightImage;
  Color textColor;

  CardSearchProperty({
    required this.image,
    required this.title,
    this.pressCard,
    this.color = Colors.white,
    this.widthImage,
    this.heightImage,
    this.textColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressCard,
      child: Container(
        width: 100.w,
        height: 100.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
          border: Border.all(color: Colors.grey.shade500,width: 0.5),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // SizedBox(height: 10),
            Image.asset(
              image,
              width: widthImage,
              height: heightImage,
              color: textColor,
            ),
          //  SizedBox(height: 10.h),
            SizedBox(height: 10),
            CustomeText(
              title: title,
              fontSize: 18.sp,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
