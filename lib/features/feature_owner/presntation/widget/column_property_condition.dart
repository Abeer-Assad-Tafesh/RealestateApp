import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class ColumnPropertyCondition extends StatelessWidget {
  GestureTapCallback? pressCard;
  String title;
  String details;

  ColumnPropertyCondition({
    this.pressCard,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomeText(
          title: title,
          color: Colors.black.withOpacity(0.6),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 180.w,
          height: 60.h,
          child: GestureDetector(
            onTap: pressCard,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomeText(
                      title: details,
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    'assets/images/arrowDown.png',
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
