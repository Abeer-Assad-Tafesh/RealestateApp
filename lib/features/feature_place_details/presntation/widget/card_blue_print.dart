import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardBluePrint extends StatelessWidget {
  GestureTapCallback? pressBtnDisplay;
  GestureTapCallback? pressBtnDelete;
  String title;

  CardBluePrint({
    this.pressBtnDisplay,
    this.pressBtnDelete,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          SizedBox(width: 10.w),
          CustomeText(
            title: title,
            color: Colors.grey,
            fontSize: 12.sp,
          ),
          Spacer(),
          CustomeBtn(
            pressBtn: pressBtnDisplay,
            title: 'DISPLAY',
            btnColor: Colors.grey,
            fontSize: 12,
            widthBtn: 65.w,
            heightBtn: 25.h,
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
