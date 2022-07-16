import 'package:flutter/material.dart';
import 'package:real_state/features/feature_owner/presntation/widget/alert_dialog_upload.dart';
import 'package:real_state/features/feature_owner/presntation/widget/item_row_alert_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardUploadItem extends StatelessWidget {
  const CardUploadItem({
    Key? key,
    required this.typeImage,
    required this.image,
  }) : super(key: key);

  final String typeImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
      child: ItemRowAlertDialog(title: typeImage,image: image,),
    ));
  }
}