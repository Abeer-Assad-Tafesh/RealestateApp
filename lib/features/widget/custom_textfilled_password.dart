import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_colors.dart';
import 'package:real_state/core/app_size.dart';
class CustomTextFilledPassword extends StatefulWidget {
  final String? hintText;
  final String ?suffixIcon;
  final String? lable;
  final ValueChanged<String> ?onChanged;
  FormFieldValidator<String>? validator;
  int? type;
  final  TextEditingController ?controller;
  final  bool isNotEmpty ;
  CustomTextFilledPassword({
    Key? key,
    this.hintText,
    this.lable,
    this.validator,
    this.suffixIcon ,
    this.onChanged,
    this.controller,
    this.type, this.isNotEmpty = false,
  }) ;
  @override
  _CustomTextFilledPasswordState createState() => _CustomTextFilledPasswordState(
      lable: lable,
      hintText:hintText,
      suffixIcon:suffixIcon,
      onChanged:onChanged,
      controller:controller,
      validator:validator,
      type: type



  );
}

class _CustomTextFilledPasswordState extends State<CustomTextFilledPassword> {
  final String? hintText;
  final String ?suffixIcon;
  final String? lable;
  final ValueChanged<String> ?onChanged;
  final  TextEditingController? controller;
  FormFieldValidator<String> ?validator;
  int ?type;
  bool? statusPassord=true;


  _CustomTextFilledPasswordState({
    Key ?key,
    this.hintText,
    this.lable,
    this.suffixIcon ,
    this.onChanged,
    this.controller,
    this.validator,
    this.type

  }) ;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* Text(lable.tr,style:TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),*/
          TextFormField(
            textInputAction:(type==null)?TextInputAction.next:TextInputAction.done ,
            obscureText: statusPassord!,
            controller: controller,
            onChanged: onChanged,
            focusNode: null,
            validator: validator,
            style:  TextStyle(color: Colors.black,fontSize: fontSize15.sp),
            onTap: (){
            },
            cursorColor: kColorButton,
            decoration: InputDecoration(
              labelText: lable,
              filled: true,
              fillColor: Colors.white,
              hintStyle:  TextStyle(color: Colors.grey[300],fontSize: fontSize15.sp),
              labelStyle:  TextStyle( color: kUnSelectTabColor,fontSize: fontSize15.sp),
              // labelStyle: new TextStyle(      color: kUnSelectTabColor,fontSize: fontSize15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Image.asset(suffixIcon!,width: 15.w,height: 15.h,)//SvgPicture.asset(ICON_SEARCH,color: Colors.white,),
              ),
              // IconButton(
              //   onPressed: (){
              //     setState(() {
              //       statusPassord=!statusPassord!;
              //     });
              //   },
              //   icon: Icon((!statusPassord!? Icons.visibility :Icons.visibility_off ) , color: (widget.isNotEmpty||!statusPassord!) ? kColorButtom :Colors.grey[300],),
              // ),
              hintText: hintText!,
              // border: InputBorder.none,
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
        ],
      ),
    );
  }
}
