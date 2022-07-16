import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_owner/presntation/widget/alert_dialog_details.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_alert_dialog.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_properties.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_upload_item.dart';
import 'package:real_state/features/feature_owner/presntation/widget/item_row_alert_dialog.dart';
import 'package:real_state/features/feature_owner/presntation/widget/item_row_alert_dialog_reminder.dart';
import 'package:real_state/features/feature_owner/presntation/widget/textField_owner.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';

class AlertDialogAddReminderFun extends StatefulWidget {

  @override
  State<AlertDialogAddReminderFun> createState() => _AlertDialogAddReminderFunState();
}

class _AlertDialogAddReminderFunState extends State<AlertDialogAddReminderFun> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: ItemRowAlertDialogReminder(title: 'Title',hint: 'title',)),
                  SizedBox(width: 10.w),
                  SizedBox(width: 110.w,child: Row(
                    children: [
                      Image.asset('assets/images/time.png',width: 25.w,height: 25.h,color: Colors.grey.shade700,),
                      SizedBox(width: 10.w),
                      Expanded(child: ItemRowAlertDialogReminder(hint: '10.00',textInputType: TextInputType.datetime,type: 0,)),
                    ],
                  )),
                ],
              ),
              SizedBox(height: 15.h),
              ItemRowAlertDialogReminder(title: 'Note',hint: 'note',),


            ],
          ),
        ),
      ),
      actions: [
        CustomeBtn(
          title: 'APPLY',
          pressBtn: () {
            Navigator.pop(context);
          },
          btnColor: Colors.grey.shade700,
        ),
        CustomeBtn(
          title: 'CANCEL',
          pressBtn: () {
            Navigator.pop(context);
          },
          btnColor: Colors.grey,
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    ); //showAlertDialog(context);
  }
}


