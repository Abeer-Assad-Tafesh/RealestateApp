import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_alert_dialog.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_alert_dialog_details.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_properties.dart';
import 'package:real_state/features/feature_owner/presntation/widget/item_row_alert_dialog.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';

class AlertDialogDetailsFun extends StatefulWidget {

  int indexImage;

  AlertDialogDetailsFun({
    required this.indexImage,
});

  @override
  State<AlertDialogDetailsFun> createState() => _AlertDialogDetailsFunState();
}

class _AlertDialogDetailsFunState extends State<AlertDialogDetailsFun> {
  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  AlertDialog showAlertDialog(
    BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      contentPadding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            widget.indexImage==0?CardAlertDialogDetails(image: 'assets/images/map1.jpg'):SizedBox(),
            widget.indexImage==1?CardAlertDialogDetails(image: 'assets/images/map2.jpg'):SizedBox(),
            widget.indexImage==2?CardAlertDialogDetails(image: 'assets/images/map3.jpg'):SizedBox(),
            widget.indexImage==3?CardAlertDialogDetails(image: 'assets/images/blue1.jpg'):SizedBox(),
            widget.indexImage==4?CardAlertDialogDetails(image: 'assets/images/blue2.jpg'):SizedBox(),
            widget.indexImage==5?CardAlertDialogDetails(image: 'assets/images/blue3.jpg'):SizedBox(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/cancel.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


