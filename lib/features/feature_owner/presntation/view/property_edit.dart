import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_colors.dart';
import 'package:real_state/features/layout.dart';
import 'package:real_state/features/widget/custome_text.dart';

import '../../../features_owner_details/presntation/view/upload_owner_details.dart';
import '../widget/alert_dialog.dart';
import '../widget/alert_dialog_upload.dart';
import '../widget/card_load.dart';
import '../widget/card_type.dart';
import '../widget/column_property_condition.dart';
import '../widget/row_add_details.dart';

class PropertyEditScreen extends StatefulWidget {
  const PropertyEditScreen({Key? key}) : super(key: key);

  @override
  State<PropertyEditScreen> createState() => _PropertyEditScreenState();
}

class _PropertyEditScreenState extends State<PropertyEditScreen> {
  bool isSelectedProperty1 = false;
  bool isSelectedProperty2 = false;
  bool isSelectedAddProperty1 = false;
  bool isSelectedAddProperty2 = false;
  bool isSelectedAddProperty3 = false;
  int _groupValue = -1;

  String dropdownValue = 'Sold';  // Initial Selected Value

  // List of items in our dropdown menu
  var items = [
    'Sold',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogFun(),
        ) ??
        false;
  }

  Future<bool> _onWillPopPhotosAndVideos() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogUploadPhotosAndVideos(
            title: 'UPLOAD PHOTOS & VIDEOS',
            typeImage1: 'UPLOAD PHOTOS',
            typeImage2: 'UPLOAD VIDEOS',
          ),
        ) ??
        false;
  }

  Future<bool> _onWillPopMap() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogUploadFun(
            title: 'UPLOAD MAP',
            typeImage1: 'UPLOAD GOOGLE MAP TYPE A',
            typeImage2: 'UPLOAD GOOGLE MAP TYPE B',
            typeImage3: 'UPLOAD GOOGLE MAP TYPE C',
          ),
        ) ??
        false;
  }

  Future<bool> _onWillPopNearBy() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogUploadFun(
            title: 'UPLOAD NEARBY UTILITIES',
            typeImage1: 'UPLOAD NEARBY HOSPITAL',
            typeImage2: 'UPLOAD NEARBY SCHOOL',
            typeImage3: 'UPLOAD NEARBY MALL',
          ),
        ) ??
        false;
  }

  Future<bool> _onWillPopBluePrint() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogUploadFun(
            title: 'UPLOAD BLUE PRINT',
            typeImage1: 'UPLOAD BLUE PRINT TYPE A',
            typeImage2: 'UPLOAD BLUE PRINT TYPE B',
            typeImage3: 'UPLOAD BLUE PRINT TYPE C',
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return BackScreenLayout(
      context,
      ScreenWidget: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height:25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25,left: 80),
                    child: CustomeText(
                      title: 'Property Edit Page',
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  // SizedBox(width: 30,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/sold_owner.png',
                      height: 24,
                      width: 24,),
                      DropdownButton(
                        // Down Arrow Icon
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        // Initial Value
                        value: dropdownValue,
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(
                height: 20.h,
              ),
              CustomeText(
                title: 'Id: 2145-MK',
                color: Colors.black.withOpacity(0.7),
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(
                height: 30,
              ),
              addNewProperty()
            ],
          ),
        ),
      ),
    );
  }

  Widget addNewProperty() {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Row(
          children: [
            CustomeText(
              title: 'SELECT THE PROPERTY',
              color: Colors.black.withOpacity(0.7),
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            CardType(
              title: 'Apartment',
              image: 'assets/images/house2_owner.png',
              widthImage: 70,
              heightImage: 70,
              color: isSelectedAddProperty1 ? kColorLightBlue : Colors.white,
              textColor: isSelectedAddProperty1
                  ? Colors.white
                  : Colors.black.withOpacity(0.7),
              pressCard: () {
                setState(() {
                  if (isSelectedAddProperty1 == false) {
                    isSelectedAddProperty1 = true;
                    isSelectedAddProperty2 = false;
                    isSelectedAddProperty3 = false;
                  } else {
                    isSelectedAddProperty1 = false;
                  }
                });
              },
            ),
            CardType(
              title: 'House',
              image: 'assets/images/house_owner.png',
              widthImage: 80,
              heightImage: 80,
              isChangeSize: true,
              color: isSelectedAddProperty2 ? kColorLightBlue : Colors.white,
              textColor: isSelectedAddProperty2
                  ? Colors.white
                  : Colors.black.withOpacity(0.7),
              pressCard: () {
                setState(() {
                  if (isSelectedAddProperty2 == false) {
                    isSelectedAddProperty1 = false;
                    isSelectedAddProperty2 = true;
                    isSelectedAddProperty3 = false;
                  } else {
                    isSelectedAddProperty2 = false;
                  }
                });
              },
            ),
            CardType(
              title: 'Villa',
              image: 'assets/images/house3_owner.png',
              widthImage: 70,
              heightImage: 70,
              color: isSelectedAddProperty3 ? kColorLightBlue : Colors.white,
              textColor: isSelectedAddProperty3
                  ? Colors.white
                  : Colors.black.withOpacity(0.7),
              pressCard: () {
                setState(() {
                  if (isSelectedAddProperty3 == false) {
                    isSelectedAddProperty1 = false;
                    isSelectedAddProperty2 = false;
                    isSelectedAddProperty3 = true;
                  } else {
                    isSelectedAddProperty3 = false;
                  }
                });
              },
            ),
          ],
        ),
        SizedBox(height: 25.h),
        isSelectedAddProperty1 ||
                isSelectedAddProperty2 ||
                isSelectedAddProperty3
            ? Column(
                children: [
                  Column(
                    children: [
                      RowAddDetails(title: 'PROPERTY ADDRESS'),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY BUDGET',
                          textInputType: TextInputType.number),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY TOTAL AREA',
                          showSuffixIcon: true,
                          textInputType: TextInputType.number),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY LIVABLE AREA',
                          showSuffixIcon: true,
                          textInputType: TextInputType.number),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY FLOOR NUMBER',
                          textInputType: TextInputType.number),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY ROOM NUMBER',
                          textInputType: TextInputType.number),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY BATHROOM NUMBER',
                          textInputType: TextInputType.number),
                      SizedBox(height: 10.h),
                      RowAddDetails(
                          title: 'PROPERTY KITCHEN NUMBER',
                          textInputType: TextInputType.number),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      ColumnPropertyCondition(
                        title: 'PROPERTY CONDITION',
                        details: 'LUXURY',
                      ),
                      ColumnPropertyCondition(
                        title: 'CONSTRUCTION YEAR',
                        details: '2022 - 2019',
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      SizedBox(width: 30.w),
                      CustomeText(
                        title: 'PROPERTY DETAILS',
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _myRadioButton(
                              title: "ELEVATOR",
                              image: 'assets/images/garden.png',
                              value: 0,
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                            ),
                            _myRadioButton(
                              title: "SWIMMING POOL",
                              image: 'assets/images/garden.png',
                              value: 1,
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                            ),
                            _myRadioButton(
                              title: "GARAGE",
                              image: 'assets/images/garden.png',
                              value: 2,
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _myRadioButton(
                              title: "GARDEN",
                              image: 'assets/images/garden.png',
                              value: 3,
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                            ),
                            _myRadioButton(
                              title: "TERRACE",
                              image: 'assets/images/garden.png',
                              value: 4,
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                            ),
                            _myRadioButton(
                              title: "FENCED YARD",
                              image: 'assets/images/garden.png',
                              value: 5,
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CardLoad(
                            title: 'UPLOAD PROPERTY PHOTOS & VIDEOS',
                            pressCard: _onWillPopPhotosAndVideos,
                          ),
                          CardLoad(
                            title: 'UPLOAD PROPERTY BLUE PRINTS',
                            pressCard: _onWillPopBluePrint,
                          ),
                          CardLoad(
                            title: 'UPLOAD PROPERTY MAP',
                            pressCard: _onWillPopMap,
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CardLoad(
                                title: 'UPLOAD PROPERTY NEARBY',
                                pressCard: _onWillPopNearBy),
                            CardLoad(
                                title: 'UPLOAD PROPERTY DETAILS',
                                pressCard: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Upload_Owner_Details()));
                                }),
                            CardLoad(title: 'UPLOAD PROPERTY CONTRACT'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 15.h),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/backBtn.png'),
                            fit: BoxFit.fill),
                      ),
                      child: CustomeText(
                        title: 'Edit',
                        color: Colors.white,
                        fontSize: 20.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(height: 25.h),
      ],
    );
  }

  Widget _myRadioButton(
      {required String title,
      String? image,
      required int value,
      double fontSize = 12,
      Color fontColor = Colors.grey,
      bool isSelected = false,
      required ValueChanged? onChanged}) {
    return SizedBox(
      child: RadioListTile(
        contentPadding: EdgeInsets.zero,
        value: value,
        groupValue: _groupValue,
        onChanged: onChanged,
        activeColor: kColorLightBlue,
        controlAffinity: ListTileControlAffinity.leading,
        visualDensity: const VisualDensity(horizontal: -4.0),
        // dense: true,
        title: Transform.translate(
          offset: const Offset(-14, 0),
          child: Row(
            children: [
              isSelected == false
                  ? Image.asset(
                      image!,
                      width: 25.w,
                      height: 25.h,
                    )
                  : const SizedBox(),
              SizedBox(width: 5.w),
              Expanded(
                child: Tooltip(
                  message: title,
                  triggerMode: TooltipTriggerMode.tap,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CustomeText(
                      title: title,
                      fontSize: fontSize.sp,
                      color: fontColor,
                      fontWeight: FontWeight.w900,
                      maxLines: 1,
                      overflow: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
