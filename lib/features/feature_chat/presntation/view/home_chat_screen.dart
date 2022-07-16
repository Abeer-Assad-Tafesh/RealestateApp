import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:real_state/features/feature_chat/presntation/widget/card_person.dart';
import 'package:real_state/features/feature_owner/presntation/widget/textField_owner.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:real_state/features/widget/custom_textfilled_app.dart';
import 'package:real_state/features/widget/custome_text.dart';

class HomeChatScreen extends StatefulWidget {
  const HomeChatScreen({Key? key}) : super(key: key);

  @override
  State<HomeChatScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50.h,
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/back.png',
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 30.w),
                  Column(
                    children: [
                      CustomeText(
                        title: 'CHAT HOME PAGE',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomeText(
                        title: 'PROPERTY ID : 2 | 50-MK',
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceDetails()));
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        child: Image.asset(
                          'assets/images/image.png',
                          width: 25.w,
                          height: 25.h,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              SizedBox(height: 20.h),
              CustomeText(
                title: 'CHAT RECORDS',
                fontSize: 16.sp,
                color: Colors.black,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      color: Color(0xfff3f6fd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: 30.h, start: 20.w, end: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeText(
                              title: 'Chat',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff202744),
                            ),
                            SizedBox(height: 15.h),
                            TextFieldOwner(
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Image.asset(
                                  'assets/images/search_chat.png',
                                  width: 20.w,
                                  height: 20.h,
                                  color: Colors.grey,
                                ),
                              ),
                              hint: 'Search',
                              type: 1,
                            ),
                            SizedBox(height: 15.h),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return CardPerson(
                                    title: 'Camrina',
                                    date: '03 Mar',
                                    supTitle:
                                        'Early prototype of product product',
                                    pressCard: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatScreen()));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
