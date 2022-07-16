
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_owner/presntation/view/owner_screen.dart';
import 'package:real_state/features/widget/custom_textfilled_app.dart';
import 'package:real_state/features/widget/custome_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late ImagePicker _imagePicker;
  XFile? _pickedFile;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imagePicker = ImagePicker();
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/notifcation.png',width: 30.w,height: 30.h,),
                  Image.asset('assets/images/logoApp.png',width: 80.w,height: 80.h,),
                  Image.asset('assets/images/menu.png',width: 30.w,height: 30.h,),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      CustomeText(
                        title: 'Create Your Account',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: () async {
                          await pickImage1();
                        },
                        child:SizedBox(
                          width: 130.w,
                          height: 80.h,
                          child: Card(
                            elevation: 3,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.5.w,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: _pickedFile != null
                                ? Center(
                                child: Image.file(
                                  File(_pickedFile!.path),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  isAntiAlias: true,
                                )):Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.w,
                                  child: CustomeText(
                                    title: 'Add photo',
                                    fontSize: 18.sp,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Image.asset('assets/images/addImage.png',width: 45.w,height: 45.h,),
                              ],
                            ),
                          ),
                        ),
                        // Center(child: Visibility(
                        //   visible: isLoading,
                        //   child: SizedBox(
                        //     height: 15.h,
                        //     width: 15.w,
                        //     child: CircularProgressIndicator(
                        //       color: Colors.grey,
                        //       strokeWidth: 3.w,
                        //     ),
                        //   ),
                        //   replacement: Container(),
                        // ),),

                      ),
                      SizedBox(height: 10.h),
                      CustomTextFilledApp(
                        lable: 'user name',
                        suffixIcon: 'assets/images/user.png',
                        hintText: 'user name',
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledApp(
                        lable: 'Mail ID',
                        suffixIcon: 'assets/images/email.png',
                        hintText: 'Mail ID',
                        paddingIcon: 12,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFilledApp(
                        lable: 'Mobil Number',
                        suffixIcon: 'assets/images/phone.png',
                        hintText: 'Mobil Number',
                        textInputType: TextInputType.phone,
                        paddingIcon: 10,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFilledApp(
                        lable: 'Password',
                        suffixIcon: 'assets/images/lock.png',
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFilledApp(
                        lable: 'Retype Password',
                        suffixIcon: 'assets/images/lock.png',
                        hintText: 'Retype Password',
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFilledApp(
                        lable: 'Select Security Question',
                        suffixIcon: 'assets/images/arrowDown.png',
                        hintText: 'Select Security Question',
                        readOnly: true,
                        pressCard: (){},
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFilledApp(
                        lable: 'Type Answer',
                        suffixIcon: 'assets/images/answer.png',
                        hintText: 'Type Answer',
                        textInputType: TextInputType.text,
                        paddingIcon: 12,
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          SizedBox(width: 30.w,height: 30.h,child: Checkbox(value: false, onChanged: (value){},)),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.bottomLeft,
                              child: CustomeText(
                                title: 'I have read and accepted the terms and conditions',
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff6EB3D0),
                            minimumSize: Size(120.w, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.w),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OwnerScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomeText(
                              title: 'Sign Up',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 10.w),
                            Image.asset(
                              'assets/images/go.png',
                              width: 20.w,
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> pickImage1() async{
    _pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(_pickedFile == null){
        print('false');
      }
    });
  }

}
