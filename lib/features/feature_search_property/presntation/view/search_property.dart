import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_home/presntation/view/home_screen.dart';
import 'package:real_state/features/feature_owner/presntation/view/owner_screen.dart';
import 'package:real_state/features/feature_register/presntation/view/owner_register.dart';
import 'package:real_state/features/feature_search_property/presntation/widget/card_search_proprety.dart';
import 'package:real_state/features/widget/custom_textfilled_app.dart';
import 'package:real_state/features/widget/custom_textfilled_password.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:real_state/features/widget/text_filed_search.dart';

class SearchProperty extends StatefulWidget {
  @override
  State<SearchProperty> createState() => _SearchPropertyState();
}

class _SearchPropertyState extends State<SearchProperty> {
  TextEditingController? searchQuery;
  TextEditingController? userNameController;
  TextEditingController? passwordController;
  TapGestureRecognizer? _tapGestureRecognizer;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  void initState() {
    // TODO: implement initState
    searchQuery = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    setState(() {
      _tapGestureRecognizer = TapGestureRecognizer()..onTap = goToSignUp;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchQuery!.dispose();
    userNameController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  void goToSignUp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const OwnerRegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),
              Image.asset(
                'assets/images/logo.png',
                width: 270.w,
                height: 270.h,
              ),
              SizedBox(height: 5.h),
              CustomeText(
                title: 'PROFESSIONAL COMPANY',
                textAlign: TextAlign.center,
                letterSpacing: 3.w,
                fontHeight: 1.h,
                color: Colors.grey,
              ),
              const Spacer(),
              Container(
                height: 450.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.w),
                    topRight: Radius.circular(50.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 0.9,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomeText(
                            title: 'I',
                            textAlign: TextAlign.center,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                          CustomeText(
                            title: ' WANT TO',
                            textAlign: TextAlign.center,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardSearchProperty(
                            image: 'assets/images/buy.png',
                            title: 'Buy',
                            widthImage: 30.w,
                            heightImage: 30.h,
                            color: isSelected1
                                ? const Color(0xff6EB3D0)
                                : Colors.white,
                            textColor: isSelected1 ? Colors.white : Colors.grey,
                            pressCard: () {
                              setState(() {
                                if (isSelected1 == false) {
                                  isSelected1 = true;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                } else {
                                  isSelected1 = false;
                                }
                              });
                            },
                          ),
                          // SizedBox(width: 15.w),
                          const Spacer(),
                          CardSearchProperty(
                            image: 'assets/images/rent2.png',
                            title: 'Rent',
                            widthImage: 35.w,
                            heightImage: 35.h,
                            color: isSelected2
                                ? const Color(0xff6EB3D0)
                                : Colors.white,
                            textColor: isSelected2 ? Colors.white : Colors.grey,
                            pressCard: () {
                              setState(() {
                                if (isSelected2 == false) {
                                  isSelected1 = false;
                                  isSelected2 = true;
                                  isSelected3 = false;
                                } else {
                                  isSelected2 = false;
                                }
                              });
                            },
                          ),
                          const Spacer(),
                          CardSearchProperty(
                            image: 'assets/images/sell.png',
                            title: 'Sell',
                            widthImage: 30.w,
                            heightImage: 30.h,
                            color: isSelected3
                                ? const Color(0xff6EB3D0)
                                : Colors.white,
                            textColor: isSelected3 ? Colors.white : Colors.grey,
                            pressCard: () {
                              setState(() {
                                if (isSelected3 == false) {
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = true;
                                } else {
                                  isSelected3 = false;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                          height: isSelected1 || isSelected2 ? 30.h : 20.h),
                      isSelected1 || isSelected2
                          ? Row(
                              children: [
                                SizedBox(width: 15.w),
                                CustomeText(
                                  title: 'Area / City',
                                  textAlign: TextAlign.center,
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      isSelected1 || isSelected2
                          ? SizedBox(height: 20.h)
                          : const SizedBox(),
                      isSelected1 || isSelected2
                          ? TextFiledSearch(
                              searchQuery: searchQuery!,
                              pressClose: () {
                                setState(() {
                                  searchQuery!.clear();
                                });
                              },
                            )
                          : const SizedBox(),
                      isSelected1 || isSelected2
                          ? SizedBox(height: 40.h)
                          : const SizedBox(),
                      isSelected1 || isSelected2
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff6EB3D0),
                                  minimumSize: Size(double.infinity, 60.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.w),
                                  )),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    title: 'Search Property',
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(width: 10.w),
                                  Image.asset(
                                    'assets/images/arrow.png',
                                    width: 35.w,
                                    height: 35.h,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      isSelected1 || isSelected2
                          ? SizedBox(height: 30.h)
                          : const SizedBox(),
                      isSelected3
                          ? Row(
                              children: [
                                Flexible(
                                  child: CustomTextFilledApp(
                                    hintText: 'user name',
                                    suffixIcon: 'assets/images/user.png',
                                    controller: userNameController,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff6EB3D0),
                                      minimumSize: Size(80.w, 55.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.w),
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OwnerScreen()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomeText(
                                        title: 'Sign In',
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 10.w),
                                      Image.asset(
                                        'assets/images/signIn.png',
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                      isSelected3 ? SizedBox(height: 5.h) : const SizedBox(),
                      isSelected3
                          ? Row(
                              children: [
                                Flexible(
                                  child: CustomTextFilledPassword(
                                    hintText: 'password',
                                    suffixIcon: 'assets/images/lock.png',
                                    controller: passwordController,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                SizedBox(
                                    width: 30.w,
                                    height: 30.h,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    )),
                                CustomeText(
                                  title: 'Remember Me',
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      isSelected3 ? SizedBox(height: 20.h) : const SizedBox(),
                      isSelected3
                          ? SizedBox(
                              width: 250.w,
                              height: 10.h,
                              child: TextButton(
                                  onPressed: () {},
                                  child: CustomeText(
                                    title: 'Forgot Password?',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade400,
                                  )),
                            )
                          : const SizedBox(),
                      isSelected3 ? SizedBox(height: 40.h) : SizedBox(),
                      isSelected3
                          ? RichText(
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
                          : const SizedBox(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
