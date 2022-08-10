
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_owner/presntation/widget/alert_dialog_details.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_alert_dialog.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_properties.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_upload_item.dart';
import 'package:real_state/features/feature_owner/presntation/widget/item_row_alert_dialog.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';


class AlertDialogUploadFun extends StatefulWidget {
  String title;
  String typeImage1;
  String typeImage2;
  String typeImage3;

  AlertDialogUploadFun({
    required this.title,
    required this.typeImage1,
    required this.typeImage2,
    required this.typeImage3,
  });

  @override
  State<AlertDialogUploadFun> createState() => _AlertDialogUploadFunState();
}

class _AlertDialogUploadFunState extends State<AlertDialogUploadFun> {
  bool get isTwo => false;



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: CustomeText(
        title: widget.title,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade700,

      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardUploadItem(
              typeImage: widget.typeImage1,
              image: 'assets/images/upload_image.png',
            ),
            SizedBox(
              height: 2.h,
            ),
            CardUploadItem(
              typeImage: widget.typeImage2,
              image:'assets/images/upload_image.png',
            ),
            SizedBox(
              height: 2.h,
            ),

            CardUploadItem(
              typeImage: widget.typeImage3,
              image: 'assets/images/upload_image.png',
            )
          ],
        ),
      ),
      actions: [
        CustomeBtn(
          title: 'CONFIRM',
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
class AlertDialogUploadPhotosAndVideos extends StatefulWidget {
  String title;
  String typeImage1;
  String typeImage2;

  AlertDialogUploadPhotosAndVideos({
    required this.title,
    required this.typeImage1,
    required this.typeImage2,
  });

  @override
  _AlertDialogUploadPhotosAndVideosState createState() => _AlertDialogUploadPhotosAndVideosState();
}

class _AlertDialogUploadPhotosAndVideosState extends State<AlertDialogUploadPhotosAndVideos> {


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: CustomeText(
        title: widget.title,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade700,

        


      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardUploadItem(
              typeImage: widget.typeImage1,
              image: 'assets/images/upload_image.png',
            ),
            SizedBox(
              height: 2.h,
            ),
            CardUploadItem(
              typeImage: widget.typeImage2,
              image: 'assets/images/video.png',

            ),
            SizedBox(
              height: 2.h,
            ),


          ],
        ),
      ),
      actions: [
        CustomeBtn(
          title: 'CONFIRM',
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



