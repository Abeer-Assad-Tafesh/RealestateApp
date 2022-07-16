import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardNumFilter extends StatelessWidget {
  String title;
  GestureTapCallback? pressCard;
  Color color;
  Color textColor;

  CardNumFilter({
    required this.title,
    this.pressCard,
    this.color = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 60.h,
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
          child: Center(
            child: CustomeText(
              title: title,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
