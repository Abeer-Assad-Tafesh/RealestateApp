import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardPerson extends StatelessWidget {
  String title;
  String? date;
  String supTitle;
  GestureTapCallback? pressCard;
  bool showWidget;

  CardPerson({
    required this.title,
    this.date,
    required this.supTitle,
    this.pressCard,
    this.showWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressCard,
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 10.w, end: 10.w, top: 10.h, bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              showWidget?CustomeText(
                title: date,
                color: Colors.grey,
                fontSize: 14.sp,
              ):SizedBox(),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35.r,
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomeText(
                            title: title,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff202744),
                          ),
                          SizedBox(height: 15.h),
                          CustomeText(
                            title: supTitle,
                            overflow: 2,
                            maxLines: 1,
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  showWidget?Container(
                    height: 25.h,
                    width: 25.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5.r),
                      color: Colors.red,
                    ),
                    child: CustomeText(
                      title: '6',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ):SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
