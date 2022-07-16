import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/features_filter/presntation/widget/card_num_filter.dart';

class ListViewRoomFilter extends StatefulWidget {
  var listNum = ['ANY', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10+'];

  int? indexList;

  @override
  State<ListViewRoomFilter> createState() => _ListViewRoomFilterState();
}

class _ListViewRoomFilterState extends State<ListViewRoomFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listNum.length,
        itemBuilder: (context, index) {
          var listNumber = widget.listNum.elementAt(index);
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w),
            child: CardNumFilter(
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



