import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/feature_owner/presntation/widget/textField_owner.dart';
import 'package:real_state/features/widget/custome_text.dart';

class RowAddDetails extends StatelessWidget {
  String title;
  bool showSuffixIcon;
  TextInputType textInputType;

  RowAddDetails({
    required this.title,
    this.showSuffixIcon = false,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomeText(
          title: title,
          color: Colors.black.withOpacity(0.6),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextFieldOwner(
            textInputType: textInputType,
            suffixIcon: showSuffixIcon ? Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/meter_owner.png',
                  width: 25.w,
                  height: 25.h,
                ),
              ],
            ):SizedBox(),
          ),
        ),
      ],
    );
  }
}
