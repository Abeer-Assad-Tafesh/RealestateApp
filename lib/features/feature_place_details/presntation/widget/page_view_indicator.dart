import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewIndicator extends StatelessWidget {
  final bool selected;

  PageViewIndicator({
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 13.sp,
      height: 13.sp,
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.grey.withOpacity(0.5),
        shape: BoxShape.circle,
        // border: selected ? Border.all(
        //   width: SizeConfig.scaleWidth(1),
        //   color: AppColors.on_boarding_text_next,
        // ) : null,
      ),
    );
  }
}
