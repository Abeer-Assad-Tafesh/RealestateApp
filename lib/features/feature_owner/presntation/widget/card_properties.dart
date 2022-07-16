import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardProperties extends StatelessWidget {
  String title;
  String image;
  GestureTapCallback? pressCard;
  Color color;
  Color textColor;
  double width;
  double height;
  double widthImage;
  double heightImage;
  double fontSize;

  CardProperties({
    required this.title,
    required this.image,
    this.pressCard,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.width = 120,
    this.height = 90,
    this.widthImage = 40,
    this.heightImage = 40,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              width: 0.5.w,
              color: Colors.grey.shade500
            )
          ),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: widthImage.w,
                height: heightImage.h,
                color: textColor,
              ),
              SizedBox(height: 10.h),
              CustomeText(
                title: title,
                color: textColor,
                fontSize: fontSize.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
