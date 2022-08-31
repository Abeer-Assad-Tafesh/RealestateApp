import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class ItemPlaceDetails extends StatelessWidget {
  String title;
  String text;

  ItemPlaceDetails({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          SizedBox(
            width: 150.w,
            child: Tooltip(
              message: title,
              triggerMode: TooltipTriggerMode.tap,
              child: CustomeText(
                title: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                maxLines: 1,
                overflow: 1,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Tooltip(
            message: text,
            triggerMode: TooltipTriggerMode.tap,
            child: CustomeText(
              title: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
              maxLines: 1,
              overflow: 1,
            ),
          ),
        ],
      ),
    );
  }
}
