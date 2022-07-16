import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/features_filter/presntation/widget/card_condition_filter.dart';

class ListViewConditionFilter extends StatefulWidget {
  var listNum = ['ALL', 'LUXURY', 'EXCELLENT', 'GOOD', 'AVERAGE', 'POOR'];
  int? indexList;

  @override
  State<ListViewConditionFilter> createState() =>
      _ListViewConditionFilterState();
}

class _ListViewConditionFilterState extends State<ListViewConditionFilter> {
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
