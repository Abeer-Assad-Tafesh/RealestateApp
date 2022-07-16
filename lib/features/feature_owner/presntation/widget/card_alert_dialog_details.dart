import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';

class CardAlertDialogDetails extends StatelessWidget {
  String image;

  CardAlertDialogDetails({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          isAntiAlias: true,
        ),
      ),
    );
  }
}
