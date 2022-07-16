
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_colors.dart';
import 'package:real_state/core/app_font.dart';
import 'package:real_state/core/app_size.dart';


class CustomTextFilledApp extends StatelessWidget {
   String ?hintText;
   String ?suffixIcon;
   String ?lable;
   int? type;
   FormFieldValidator<String> ?validator;
  ValueChanged<String>? onChanged;
    TextEditingController? controller;
   FocusNode ?focusNode;
    String ?fontFamily;
   TextInputType? textInputType;
   bool obscureText;
   double paddingIcon;
   bool readOnly;
   GestureTapCallback? pressCard;


   CustomTextFilledApp({
    Key ?key,
    this.hintText,
    this.lable,
     this.fontFamily,
     this.focusNode=null,
     this.type,
    this.suffixIcon ,
    this.onChanged,
    this.controller,
    this.validator,
     this.textInputType = TextInputType.emailAddress,
     this.obscureText = false,
     this.paddingIcon = 15,
     this.readOnly = false,
     this.pressCard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
  /*      Text(lable.tr,style:TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),*/
          GestureDetector(
            onTap: pressCard,
            child: TextFormField(
            controller: controller,
            onChanged: onChanged,
              focusNode: focusNode,
              readOnly: readOnly,
              // textInputAction:(type==null)?TextInputAction.next:TextInputAction.done ,

              keyboardType: textInputType,
            obscureText: obscureText,
            validator: validator,
              style:  TextStyle(color: Colors.black,
                  fontFamily: fontFamily??FONT_CairoFont,
                  fontSize: fontSize15.sp),

              cursorColor: kColorButtom,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: lable!,

              hintStyle:  TextStyle(      color: Colors.grey[300],fontFamily:  fontFamily??FONT_CairoFont,fontSize: fontSize15.sp,),
              labelStyle:  TextStyle(      color: kUnSelectTabColor,fontFamily:  fontFamily??FONT_CairoFont,fontSize: fontSize15.sp,),

              prefixIcon: Padding(
                  padding: EdgeInsets.only(right: paddingIcon.w, left: paddingIcon.w),
                  child: Image.asset(suffixIcon!,width: 20.w,height: 20.h,)//SvgPicture.asset(ICON_SEARCH,color: Colors.white,),
              ),
            hintText: hintText!,
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10.w),
            //     borderSide: BorderSide(width: 0.5,color: kSearchFiledColor)
            // ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(width: 0.5,color: kSearchFiledColor)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  borderSide: BorderSide(width: 0.5,color: kSearchFiledColor),
              ),

            ),

            ),
          ),
        ],
      ),
    );
    }


}
