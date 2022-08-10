import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_home/presntation/view/home_screen.dart';
import 'package:real_state/features/features_filter/presntation/widget/listView_condition_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/listView_room_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/card_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/card_num_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/listView_year_filter.dart';
import 'package:real_state/features/features_filter/presntation/widget/list_view_filter.dart';
import 'package:real_state/features/layout.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:real_state/features/widget/text_filed_search.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int? indexList;
  RangeValues _currentRangeValuesBudget = RangeValues(20000, 150000);
  RangeValues _currentRangeValuesArea = RangeValues(50, 500);
  TextEditingController? searchQuery;

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
    int currentIndex=0;

    return BackScreenLayout(context,
        ScreenWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 15.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15.w),
                          CustomeText(
                            title: 'Area / City',
                            textAlign: TextAlign.center,
                            color: Colors.black,
                            fontSize: 24.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextFiledSearch(
                        searchQuery: searchQuery!,
                        pressClose: () {
                          setState(() {
                            searchQuery!.clear();
                          });
                        },
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 15.w),
                        child: CustomeText(
                          title: 'TYPE OF PROPERTY',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 130.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context,currentIndex ) {
                            return CardFilter(
                              color: indexList == currentIndex
                                  ? Color(0xff6EB3D0)
                                  : Colors.white,
                              textColor:
                              indexList == currentIndex
                                  ? Colors.white : Colors.grey,
                              pressCard: () {
                                setState(() {
                                  indexList = currentIndex;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 25.h),

                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 15.w),
                        child: CustomeText(
                          title: 'PROPERTY BUDGET',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      RangeSlider(
                        values: _currentRangeValuesBudget,
                        max: 300000,
                        divisions: 10,
                        inactiveColor: Colors.grey.shade300,
                        activeColor: Colors.grey.shade700,
                        // labels: RangeLabels(
                        //   _currentRangeValues.start.round().toString(),
                        //   _currentRangeValues.end.round().toString(),
                        // ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValuesBudget = values;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(),
                          CustomeText(
                            title: _currentRangeValuesBudget.start.toString(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          CustomeText(
                            title: 'USD',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          CustomeText(
                            title: _currentRangeValuesBudget.end.toString(),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 15.w),
                        child: CustomeText(
                          title: 'PROPERTY AREA',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      RangeSlider(
                        values: _currentRangeValuesArea,
                        max: 1000,
                        divisions: 10,
                        inactiveColor: Colors.grey.shade300,
                        activeColor: Colors.grey.shade700,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValuesArea = values;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(),
                          CustomeText(
                            title:
                            '${_currentRangeValuesArea.start.toString()} M',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          CustomeText(
                            title: 'Square Meters',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          CustomeText(
                            title: '${_currentRangeValuesArea.end.toString()} M',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      ListViewFilter(title: 'PROPERTY FLOOR'),
                      SizedBox(height: 25.h),
                      ListViewFilter(title: 'PROPERTY ROOM'),
                      SizedBox(height: 25.h),
                      ListViewFilter(title: 'PROPERTY BATHROOM'),
                      SizedBox(height: 25.h),
                      ListViewFilter(title: 'PROPERTY KITCHEN'),
                      SizedBox(height: 25.h),
                      ListViewFilter(title: 'PROPERTY CONDITION',typeFilter: 2,),
                      SizedBox(height: 25.h),
                      ListViewFilter(title: 'PROPERTY CONDITION',typeFilter: 3,),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen()), (route) => false);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffb2b4b7),
                                    Color(0xff505153),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Row(
                                children: [
                                  CustomeText(
                                    title: 'FILTER',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: 15.w),
                                  Image.asset('assets/images/filter.png',width: 30.w,height: 30.h,color: Colors.white,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h)
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
