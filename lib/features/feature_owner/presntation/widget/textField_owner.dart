import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldOwner extends StatelessWidget {
  Widget? suffixIcon;
  TextInputType textInputType;
  String? hint;
  int? type;

  TextFieldOwner({
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.hint,
    this.type = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextField(
        cursorColor: Colors.black,
        cursorWidth: 2.w,
        cursorHeight: 25.h,
        keyboardType: textInputType,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: type == 0?BorderSide(width: 0.5, color: Colors.black):BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: type == 0?BorderSide(width: 0.5, color: Colors.black):BorderSide.none,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: type == 0?BorderSide(width: 0.5, color: Colors.black):BorderSide.none,
          ),
          suffixIcon:suffixIcon,
          hintText: hint,
          fillColor: type == 0 ? Colors.transparent:Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
