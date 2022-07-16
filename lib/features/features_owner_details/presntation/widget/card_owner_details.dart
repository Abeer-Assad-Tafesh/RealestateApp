import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOwnerDetails extends StatelessWidget {
  String image;
  GestureTapCallback? pressCard;

  CardOwnerDetails({
    required this.image,
    this.pressCard
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 47.w,
      height: 47.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Image.asset(
              image,
              width: 25.w,
              height: 25.h,
            ),
          ),
        ),
      ),
    );
  }
}
