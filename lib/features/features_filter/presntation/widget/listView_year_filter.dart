import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/features_filter/presntation/widget/card_condition_filter.dart';

class ListViewYearFilter extends StatefulWidget {
  var listNum = [
    'ALL',
    '2022 – 2019',
    '2018 – 2015',
    '2014 – 2011',
    '2010 – 2007',
    '2006 ➡'
  ];

  int? indexList;

  @override
  State<ListViewYearFilter> createState() => _ListViewYearFilterState();
}

class _ListViewYearFilterState extends State<ListViewYearFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listNum.length,
        itemBuilder: (context, index) {
          var listNumber = widget.listNum.elementAt(index);
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w),
            child: CardConditionFilter(
              title: listNumber.toString(),
              textColor: widget.indexList != index ? Colors.grey.shade600:Colors.white,
              color: widget.indexList == index ? Color(0xff6EB3D0):Colors.white,
              pressCard: (){
                setState(() {
                  widget.indexList = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}


