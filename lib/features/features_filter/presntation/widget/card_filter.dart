import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardFilter extends StatelessWidget {
  GestureTapCallback? pressCard;
  Color color;
  Color textColor;

  CardFilter({
    this.pressCard,
    this.color = Colors.white,
    this.textColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      height: 130.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5.h),
              Image.asset(
                'assets/images/select.png',
                width: 80.w,
                height: 80.h,
                color: textColor,
              ),
              SizedBox(height: 7.h),
              CustomeText(
                title: 'Select All',
                fontSize: 22.sp,
                color: textColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
