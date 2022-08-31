import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_colors.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardLoad extends StatelessWidget {

  String title;
  GestureTapCallback? pressCard;

  CardLoad({
    required this.title,
    this.pressCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 50.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Card(
          elevation: 4,
          color: kColorLightBlue,
          child: Center(
            child: CustomeText(
              title: title,
              fontSize: 11.sp,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
