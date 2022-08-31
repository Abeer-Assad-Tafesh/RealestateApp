import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:real_state/features/feature_owner/presntation/view/owner_screen.dart';
import 'package:real_state/features/feature_register/presntation/view/user_register.dart';
import 'package:real_state/features/layout.dart';
import 'package:real_state/features/widget/custom_textfilled_app.dart';
import 'package:real_state/features/widget/custome_text.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  XFile? _pickedFile;
  bool isLoading = false;
  TapGestureRecognizer? _tapGestureRecognizer;
  TextEditingController? passwordController;

  @override
  void initState() {
    // TODO: implement initState
    passwordController = TextEditingController();
    setState(() {
      _tapGestureRecognizer = TapGestureRecognizer()..onTap = goToSignUp;
    });
    super.initState();
  }

  void goToSignUp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const UserRegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return AppBarLayout(
      context,
      ScreenWidget: Column(
        children: [
          SizedBox(height: 40.h),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 130.w,
                        height: 130.h,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Card(
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              shape: const CircleBorder(),
                              child: _pickedFile != null
                                  ? Center(
                                      child: Image.file(
                                      File(_pickedFile!.path),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      isAntiAlias: true,
                                    ))
                                  : Center(
                                      child: Image.asset(
                                          'assets/images/user.png',
                                          fit: BoxFit.cover),
                                    ),
                            ),
                          ],
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
                      lable: 'Mail ID',
                      suffixIcon: 'assets/images/email.png',
                      hintText: 'Mail ID',
                      paddingIcon: 12,
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff6EB3D0),
                          minimumSize: Size(120.w, 60.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.w),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomeText(
                            title: 'Login',
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
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Don\'t Have Account ? ',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: 'Sign Up',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
