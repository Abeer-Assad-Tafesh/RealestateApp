import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_owner/presntation/widget/alert_dialog_details.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_alert_dialog.dart';
import 'package:real_state/features/feature_owner/presntation/widget/card_properties.dart';
import 'package:real_state/features/feature_owner/presntation/widget/item_row_alert_dialog.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';

class AlertDialogFun extends StatefulWidget {
  bool isSelectedT1 = false;
  bool isSelectedT2 = false;
  bool isSelectedT3 = false;
  bool showContract = false;
  bool showMap = false;
  bool showBluePrint = false;

  var listContract = [
    'RENT CONTRACT 2022 FILE',
    'RENT CONTRACT 2021 FILE',
    'RENT CONTRACT 2020 FILE',
    'RENT CONTRACT 2019 FILE',
    'RENT CONTRACT 2018 FILE',
    'RENT CONTRACT 2017 FILE',
    'RENT CONTRACT 2016 FILE',
    'RENT CONTRACT 2015 FILE'
  ];



  @override
  State<AlertDialogFun> createState() => _AlertDialogFunState();
}


class _AlertDialogFunState extends State<AlertDialogFun> {



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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context,true);
                  },
                  child: Image.asset(
                    'assets/images/cancel.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
            CustomeText(
              title: 'PROPERTY DOCUMENTS',
              color: Colors.black,
              fontSize: 16.sp,
            ),
            SizedBox(height: 8.h),
            CustomeText(
              title: 'PROPERTY ID : 2 | 50-MK',
              color: Colors.grey,
              fontSize: 14.sp,
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardProperties(
                  title: 'CONTRACT',
                  image: 'assets/images/contract.png',
                  width: 80,
                  height: 80,
                  widthImage: 30,
                  heightImage: 30,
                  fontSize: 12,
                  color: widget.isSelectedT1
                      ? Colors.grey.shade400
                      : Colors.white,
                  textColor: widget.isSelectedT1
                      ? Colors.white
                      : Colors.black.withOpacity(0.7),
                  pressCard: () {
                    setState(() {
                      if (widget.isSelectedT1 == false) {
                        widget.isSelectedT1 = true;
                        widget.isSelectedT2 = false;
                        widget.isSelectedT3 = false;
                        widget.showContract = true;
                        widget.showMap = false;
                        widget.showBluePrint = false;
                      } else {
                        widget.isSelectedT1 = false;
                        widget.showContract = false;
                      }
                    });
                  },
                ),
                CardProperties(
                  title: 'MAP',
                  image: 'assets/images/map.png',
                  width: 80,
                  height: 80,
                  widthImage: 30,
                  heightImage: 30,
                  fontSize: 12,
                  color: widget.isSelectedT2
                      ? Colors.grey.shade400
                      : Colors.white,
                  textColor: widget.isSelectedT2
                      ? Colors.white
                      : Colors.black.withOpacity(0.7),
                  pressCard: () {
                    setState(() {
                      if (widget.isSelectedT2 == false) {
                        widget.isSelectedT1 = false;
                        widget.isSelectedT2 = true;
                        widget.isSelectedT3 = false;
                        widget.showMap = true;
                        widget.showBluePrint = false;
                        widget.showContract = false;
                      } else {
                        widget.isSelectedT2 = false;
                        widget.showMap = false;
                      }
                    });
                  },
                ),
                CardProperties(
                  title: 'BLUE PRINT',
                  image: 'assets/images/bluePrint.png',
                  width: 80,
                  height: 80,
                  widthImage: 30,
                  heightImage: 30,
                  fontSize: 12,
                  color: widget.isSelectedT3
                      ? Colors.grey.shade400
                      : Colors.white,
                  textColor: widget.isSelectedT3
                      ? Colors.white
                      : Colors.black.withOpacity(0.7),
                  pressCard: () {
                    setState(() {
                      if (widget.isSelectedT3 == false) {
                        widget.isSelectedT1 = false;
                        widget.isSelectedT2 = false;
                        widget.isSelectedT3 = true;
                        widget.showBluePrint = true;
                        widget.showMap = false;
                        widget.showContract = false;
                      } else {
                        widget.isSelectedT3 = false;
                        widget.showBluePrint = false;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15.h),
            widget.showContract
                ? ItemRowAlertDialog(title: 'CONTRACT LIST')
                : SizedBox(),
            widget.showContract ? contractList() : SizedBox(),
            widget.showMap ? mapList() : SizedBox(),
            widget.showBluePrint ? bluePrintList() : SizedBox(),
          ],
        ),
      ),
    );//showAlertDialog(context);
  }


  Widget contractList() {
    return SizedBox(
      height: 500.h,
      child: ListView.builder(
        itemCount: widget.listContract.length,
        itemBuilder: (context, index) {
          String myList = widget.listContract.elementAt(index);
          return Column(
            children: [
              CardAlertDialog(
                title: myList,
                pressBtnDisplay: () {},
                pressBtnDelete: () {},
              ),
            ],
          );
        },
      ),
    );
  }

  Widget mapList() {
    return Column(
      children: [
        ItemRowAlertDialog(title: 'MAP LIST'),
        CardAlertDialog(
          title: 'GOOGLE MAP TYPE A',
          pressBtnDisplay: (){
            showDialog(
                context: context,
                builder: (context) => new AlertDialogDetailsFun(indexImage: 0),
            );
          },
          pressBtnDelete: () {},
        ),
        CardAlertDialog(
          title: 'GOOGLE MAP TYPE B',
          pressBtnDisplay: (){
            showDialog(
              context: context,
              builder: (context) => new AlertDialogDetailsFun(indexImage: 1),
            );
          },
          pressBtnDelete: () {},
        ),
        CardAlertDialog(
          title: 'GOOGLE MAP TYPE C',
          pressBtnDisplay: (){
            showDialog(
              context: context,
              builder: (context) => new AlertDialogDetailsFun(indexImage: 2),
            );
          },
          pressBtnDelete: () {},
        ),
      ],
    );
  }

  Widget bluePrintList() {
    return Column(
      children: [
        ItemRowAlertDialog(title: 'BLUE PRINT LIST'),
        CardAlertDialog(
          title: 'BLUE PRINT TYPE A',
          pressBtnDisplay: (){
            showDialog(
              context: context,
              builder: (context) => new AlertDialogDetailsFun(indexImage: 3),
            );
          },
          pressBtnDelete: () {},
        ),
        CardAlertDialog(
          title: 'BLUE PRINT TYPE B',
          pressBtnDisplay: (){
            showDialog(
              context: context,
              builder: (context) => new AlertDialogDetailsFun(indexImage: 4),
            );
          },
          pressBtnDelete: () {},
        ),
        CardAlertDialog(
          title: 'BLUE PRINT TYPE C',
          pressBtnDisplay: (){
            showDialog(
              context: context,
              builder: (context) => new AlertDialogDetailsFun(indexImage: 5),
            );
          },
          pressBtnDelete: () {},
        ),
      ],
    );
  }


}
