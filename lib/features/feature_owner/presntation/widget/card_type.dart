import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardType extends StatelessWidget {
  String title;
  String image;
  GestureTapCallback? pressCard;
  Color color;
  Color textColor;
  double widthImage;
  double heightImage;
  bool isChangeSize;

  CardType({
    required this.title,
    required this.image,
    this.pressCard,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.widthImage = 60,
    this.heightImage = 60,
    this.isChangeSize = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 120.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              width: 0.5.w,
              color: Colors.grey.shade500
            ),
          ),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: widthImage.w,
                height: heightImage.h,
                color: textColor,
              ),
              isChangeSize?SizedBox(height: 10.h):SizedBox(height: 15.h),
              CustomeText(
                title: title,
                color: textColor,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
