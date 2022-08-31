import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_colors.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';

class ItemTitleSpaceDetails extends StatelessWidget {
  String title;
  String? btnText;
  double btnWidth;
  bool showBtn;
  GestureTapCallback? pressBtn;

  ItemTitleSpaceDetails({
    required this.title,
    this.btnText,
    this.showBtn = true,
    this.pressBtn,
    this.btnWidth = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15.w),
        CustomeText(
          title: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        Spacer(),
        showBtn?SizedBox(
          width: btnWidth.w,
          child: CustomeBtn(
            pressBtn: pressBtn,
            title: btnText!,
            btnColor: kColorLightBlue,
            heightBtn: 35.h,
            widthBtn: 60.w,
            fontSize: 16.sp,
          ),
        ):SizedBox(),
        SizedBox(width: 15.w),
      ],
    );
  }
}
