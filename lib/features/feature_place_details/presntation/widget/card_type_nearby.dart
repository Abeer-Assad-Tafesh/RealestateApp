import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardTypeNearby extends StatelessWidget {
  String title;
  String image;
  GestureTapCallback? pressCard;
  Color color;
  Color textColor;
  double widthImage;
  double heightImage;
  bool isChangeSize;

  CardTypeNearby({
    required this.title,
    required this.image,
    this.pressCard,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.widthImage = 40,
    this.heightImage = 40,
    this.isChangeSize = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 70.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
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
              SizedBox(height: 5.h),
              CustomeText(
                title: title,
                color: textColor,
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
