import 'package:flutter/material.dart';
import 'package:real_state/features/features_filter/presntation/widget/listView_condition_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/listView_room_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/listView_year_filter.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewFilter extends StatelessWidget {
  String title;
  int typeFilter;

  ListViewFilter({
    required this.title,
    this.typeFilter = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w),
          child: CustomeText(
            title: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 10.h),
        typeFilter==1?ListViewRoomFilter():SizedBox(),
        typeFilter==2?ListViewConditionFilter():SizedBox(),
        typeFilter==3?ListViewYearFilter():SizedBox(),
      ],
    );
  }
}
