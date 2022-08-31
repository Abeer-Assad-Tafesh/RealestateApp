import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_colors.dart';
import '../../core/app_font.dart';
import '../../core/app_size.dart';

Widget defaultTextForm({
  required TextEditingController textEditingController,
  required TextInputType textInputType,
  ValueChanged<String>? onFieldSubmitted,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  bool isPassword=false,
   FormFieldValidator<String>? validator,
   String label='',
IconData? iconData,
  IconData? iconDataSuffixx,
  bool isenable=true,
  String ?fontFamily
})=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child:   Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.w),),
    child: TextFormField(

      controller: textEditingController,

      keyboardType: textInputType,

      onFieldSubmitted:onFieldSubmitted,

      onChanged: onChanged,

      validator: validator,

      onTap: onTap,

      enabled:isenable,

    obscureText: isPassword,
      cursorColor: kColorButton,
      decoration: InputDecoration(

        prefixIcon:Icon(iconData,color: kUnSelectTabColor,) ,

        label: Text(label),
        labelStyle:  TextStyle(      color: kUnSelectTabColor,fontFamily:  fontFamily??FONT_CairoFont,fontSize: fontSize15.sp,),


        //icon: Icon(iconData),


iconColor: kUnSelectTabColor,
        suffixIcon: Icon(iconDataSuffixx),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 0.5,color: kSearchFiledColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(width: 0.5,color: kSearchFiledColor),
        ),

        border:InputBorder.none ,

        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),







      ),





    ),
  ),
);

Future navigatTo(context,Widget widget)=> Navigator.push(context,
      MaterialPageRoute(builder: (context)=>widget)
  );
Future navigatAndRemove(context,Widget widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>widget),
    (route)=>false
);



