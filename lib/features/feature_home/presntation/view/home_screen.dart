import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:real_state/features/feature_home/presntation/widget/card_camera.dart';
import 'package:real_state/features/feature_home/presntation/widget/card_more_details.dart';
import 'package:real_state/features/feature_home/presntation/widget/card_details.dart';
import 'package:real_state/features/feature_home/presntation/widget/item_row_sort.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:real_state/features/feature_search_property/presntation/view/search_property.dart';
import 'package:real_state/features/features_filter/presntation/view/filter_screen.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:real_state/features/widget/text_filed_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? searchQuery;
  bool showSortList = false;
  int _groupValue = -1;

  var listImages = [
    'assets/images/place1.png',
    'assets/images/place2.jpg',
    'assets/images/place3.png',
    'assets/images/place4.png',
    'assets/images/place5.png'
  ];

  List<dynamic> listFilter = [
    'NEWEST',
    'PRICE (LOW TO HIGH)',
    'PRICE (HIGH TO LOW)',
    'BEDS (LEAST)',
    'BEDS (MOST)',
    'AREA (LOW TO HIGH)',
    'AREA (HIGH TO LOW)',
  ];

  @override
  void initState() {
    // TODO: implement initState
    searchQuery = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SearchProperty()), (route) => false);
                          },
                          child: Container(
                            height: 50.h,
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/images/back.png',
                              width: 30.w,
                              height: 30.h,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Image.asset(
                          'assets/images/notifcation.png',
                          width: 30.w,
                          height: 30.h,
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/logoApp.png',
                          width: 80.w,
                          height: 80.h,
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/menu.png',
                          width: 30.w,
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFiledSearch(
                            searchQuery: searchQuery!,
                            imageSearch: 'assets/images/search.png',
                            widthImageSearch: 35,
                            heightImageSearch: 35,
                            pressClose: () {
                              setState(() {
                                searchQuery!.clear();
                              });
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FilterScreen()));
                          },
                          icon: Image.asset(
                            'assets/images/filter1.png',
                            width: 35.w,
                            height: 35.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomeText(
                          title: '40+ Places found to buy',
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),

                        /*DropdownButton(
                          alignment: Alignment.bottomRight,
                          underline: SizedBox(),
                          icon: SizedBox(),
                          hint: Row(
                            children: [
                              Image.asset(
                                'assets/images/sort.png',
                                width: 15.w,
                                height: 15.h,
                              ),
                              SizedBox(width: 2.w),
                              CustomeText(
                                title: 'Sort',
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          value: dropDownValue,
                          onChanged: (newVal) {
                            setState(() {
                              // dropDownValue = newVal;
                            });
                          },
                          items:listFilter.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              enabled: true,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: Checkbox(
                                        value: false,
                                        onChanged: (value) {},
                                      )),
                                  SizedBox(width: 5.w),
                                  CustomeText(
                                    title: value,
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          /*[
                            DropdownMenuItem(
                              value: 0,
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: Checkbox(
                                        value: false,
                                        onChanged: (value) {},
                                      )),
                                  SizedBox(width: 5.w),
                                  CustomeText(
                                    title: 'NEWEST',
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text('Red'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('Blue'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('Green'),
                            ),
                          ],*/
                        ),*/

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (showSortList == false) {
                                showSortList = true;
                              } else {
                                showSortList = false;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/sort.png',
                                width: 15.w,
                                height: 15.h,
                              ),
                              SizedBox(width: 2.w),
                              CustomeText(
                                title: 'Sort',
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsetsDirectional.only(bottom: 20.h),
                      itemBuilder: (context, index) {
                        String listImage = listImages.elementAt(index);
                        return Column(
                          children: [
                            Card(
                              elevation: 10,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                        listImage,
                                        width: double.infinity,
                                        isAntiAlias: true,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 5.w),
                                          Column(
                                            children: [
                                              SizedBox(height: 15.h),
                                              CardCamera(
                                                  image:
                                                      'assets/images/camera.png',
                                                  title: '8'),
                                              CardCamera(
                                                  image:
                                                      'assets/images/video.png',
                                                  title: '3'),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(height: 8.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CardMoreDetails(
                                                  image:
                                                      'assets/images/call.png'),
                                              CardMoreDetails(
                                                  image:
                                                      'assets/images/chat.png',
                                                pressCard: (){
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ChatScreen()));
                                                },
                                              ),
                                              CardMoreDetails(
                                                  image:
                                                      'assets/images/favorite.png'),
                                              CardMoreDetails(
                                                  image:
                                                      'assets/images/share.png'),
                                              SizedBox(width: 5.w),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CardDetails(
                                            image: 'assets/images/bath.png',
                                            title: '2 Baths'),
                                        CardDetails(
                                            image: 'assets/images/bath.png',
                                            title: '4 Beds'),
                                        CardDetails(
                                            image: 'assets/images/bath.png',
                                            title: '4 Rooms'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/location.png',
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        CustomeText(
                                          title: 'Central park, RAFAH, GAZA',
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff6EB3D0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.w),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlaceDetails()));
                                          },
                                          child: CustomeText(
                                            title: 'Details ...',
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h)
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              showSortList ? Positioned(
                right: 10.w,
                  top: 220.h,
                  child: CardListSort()
              ) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardListSort() {
    return SizedBox(
      width: 200.w,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            _myRadioButton(title: 'NEWEST',value: 0, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            _myRadioButton(title: 'PRICE (LOW TO HIGH)',value: 1, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            _myRadioButton(title: 'PRICE (HIGH TO LOW)',value: 2, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            _myRadioButton(title: 'BEDS (LEAST)',value: 3, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            _myRadioButton(title: 'BEDS (MOST)',value: 4, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            _myRadioButton(title: 'AREA (LOW TO HIGH)',value: 5, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            _myRadioButton(title: 'AREA (HIGH TO LOW)',value: 6, onChanged: (newValue) => setState(() => _groupValue = newValue),),
            SizedBox(height: 10.h),
            CustomeBtn(
              pressBtn: () {},
              title: 'Apply',
              btnColor: Colors.grey.shade700,
              heightBtn: 38.h,
              widthBtn: 110.w,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }


  Widget _myRadioButton(
      {required String title,
        String? image,
        required int value,
        double fontSize = 12,
        Color fontColor = Colors.grey,
        bool isSelected = true,
        required ValueChanged? onChanged}) {
    return SizedBox(
      height: 35.h,
      child: RadioListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        value: value,
        groupValue: _groupValue,
        onChanged: onChanged,
        visualDensity: VisualDensity(horizontal: -4.0),
        dense: true,
        title: Row(
          children: [
            isSelected == false
                ? Image.asset(
              image!,
              width: 25.w,
              height: 25.h,
            )
                : SizedBox(),
            CustomeText(
              title: title,
              fontSize: fontSize.sp,
              color: fontColor,
              fontWeight: FontWeight.w900,
            ),
          ],
        ),
      ),
    );
  }
}
