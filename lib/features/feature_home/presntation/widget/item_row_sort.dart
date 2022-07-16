import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/custome_text.dart';


class ItemRowSort extends StatefulWidget {
  String title;
  bool isChecked = false;

  ItemRowSort({
    required this.title,
  });

  @override
  State<ItemRowSort> createState() => _ItemRowSortState();
}

class _ItemRowSortState extends State<ItemRowSort> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        SizedBox(
            width: 30.w,
            height: 30.h,
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (value) {
                setState(() {
                  widget.isChecked = value!;
                });
              },
            )),
        CustomeText(
          title: widget.title,
          fontSize: 12.sp,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}



