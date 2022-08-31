import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:real_state/features/features_owner_details/presntation/widget/card_camera_owner_details.dart';
import 'package:real_state/features/features_owner_details/presntation/widget/card_details_ownerDetails.dart';
import 'package:real_state/features/features_owner_details/presntation/widget/card_more_details_owner_details.dart';
import 'package:real_state/features/features_owner_details/presntation/widget/card_owner_details.dart';
import 'package:real_state/features/features_owner_details/presntation/widget/item_row_owner_details.dart';
import 'package:real_state/features/layout.dart';
import 'package:real_state/features/open_contact_apps.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerDetails extends StatefulWidget {
  const OwnerDetails({Key? key}) : super(key: key);

  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  int _groupValue = -1;
  bool showSortList = false;

  // ···
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'smith@example.com',
  );

  var listImages = [
    'assets/images/place1.png',
    'assets/images/place2.jpg',
    'assets/images/place3.png',
    'assets/images/place4.png',
    'assets/images/place5.png'
  ];

  bool showDisplayOwner = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return BackScreenLayout(
      context,
      ScreenWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.5.w,
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 5.w),
                            child: CustomeText(
                              title: 'Owner Details',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemRowOwnerDetails(
                                    image: 'assets/images/user_owner.png',
                                    title: 'William Wallas'),
                                ItemRowOwnerDetails(
                                    image: 'assets/images/phone_owner.png',
                                    title: '2145-5236'),
                                ItemRowOwnerDetails(
                                    image: 'assets/images/call_owner.png',
                                    title: '08-2145-5236'),
                                ItemRowOwnerDetails(
                                    image: 'assets/images/gmail.png',
                                    title: 'William@Walla.com'),
                                ItemRowOwnerDetails(
                                    image: 'assets/images/location_owner.png',
                                    title: '124 main st.Dallas, Tx, 72005'),
                                ItemRowOwnerDetails(
                                    image: 'assets/images/time_owner.png',
                                    title: 'Mon-Fri (10:00AM - 4:00PM)'),
                              ],
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ItemRowOwnerDetails(
                                    image: 'assets/images/microphone.png',
                                    title: '27-03-2021',
                                    fontColor: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Image.asset(
                                    'assets/images/Andego.png',
                                    width: 160.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CardOwnerDetails(
                                        image: 'assets/images/call.png',
                                        pressCard: () {
                                          // [To open call app] 2 steps
                                          // 1- url_launcher: ^6.1.5 on pubspec.yaml
                                          // 2- make a function with required code and call it when press.
                                          makePhoneCall('0595395820');
                                        },
                                      ),
                                      CardOwnerDetails(
                                          image: 'assets/images/chat.png',
                                          pressCard: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatScreen()),
                                            );
                                          }),
                                      CardOwnerDetails(
                                          image: 'assets/images/gmail.png',
                                          pressCard: () {
                                            print('emailLaunchUri==>$emailLaunchUri');
                                            launchUrl(emailLaunchUri);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: CustomeBtn(
                                pressBtn: () {
                                  setState(() {
                                    if (showDisplayOwner == false) {
                                      showDisplayOwner = true;
                                    } else {
                                      showDisplayOwner = false;
                                    }
                                  });
                                },
                                title: 'Display Owner\'s properties',
                                fontSize: 16.sp,
                                btnColor: const Color(0xff6EB3D0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        showDisplayOwner
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomeText(
                                      title: '40+ Places found to buy',
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (showSortList == false) {
                                            showSortList = true;
                                          } else {
                                            showSortList = false;
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/sort.png',
                                            width: 15.w,
                                            height: 15.h,
                                          ),
                                          SizedBox(width: 2.w),
                                          CustomeText(
                                            title: 'Sort',
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        SizedBox(height: 5.h),
                        showDisplayOwner
                            ? SizedBox(
                                height: 500.h,
                                child: ListView.builder(
                                  itemCount: 5,
                                  padding:
                                      EdgeInsetsDirectional.only(bottom: 20.h),
                                  itemBuilder: (context, index) {
                                    String listImage =
                                        listImages.elementAt(index);
                                    return Column(
                                      children: [
                                        Card(
                                          elevation: 10,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Image.asset(
                                                    listImage,
                                                    width: double.infinity,
                                                    isAntiAlias: true,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(width: 5.w),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                              height: 15.h),
                                                          CardCameraOwnerDetails(
                                                              image:
                                                                  'assets/images/camera.png',
                                                              title: '8'),
                                                          CardCameraOwnerDetails(
                                                              image:
                                                                  'assets/images/video.png',
                                                              title: '3'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(height: 8.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CardMoreDetailsOwnerDetails(
                                                            image:
                                                                'assets/images/call.png',
                                                            onTap: () {
                                                              // [To open call app] 2 steps
                                                              // 1- url_launcher: ^6.1.5 on pubspec.yaml
                                                              // 2- make a function with required code and call it when press.
                                                              makePhoneCall(
                                                                  '0595395820');
                                                            },
                                                          ),
                                                          CardMoreDetailsOwnerDetails(
                                                              image:
                                                                  'assets/images/chat.png'),
                                                          CardMoreDetailsOwnerDetails(
                                                              image:
                                                                  'assets/images/favorite.png'),
                                                          CardMoreDetailsOwnerDetails(
                                                              image:
                                                                  'assets/images/share.png',),
                                                          SizedBox(width: 5.w),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CardDetailsOwnerDetails(
                                                        image:
                                                            'assets/images/bath.png',
                                                        title: '2 Baths'),
                                                    CardDetailsOwnerDetails(
                                                        image:
                                                            'assets/images/bath.png',
                                                        title: '4 Beds'),
                                                    CardDetailsOwnerDetails(
                                                        image:
                                                            'assets/images/bath.png',
                                                        title: '4 Rooms'),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/location.png',
                                                      width: 25.w,
                                                      height: 25.h,
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    CustomeText(
                                                      title:
                                                          'Central park, RAFAH, GAZA',
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    Spacer(),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xff6EB3D0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.w),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PlaceDetails()));
                                                      },
                                                      child: CustomeText(
                                                        title: 'Details ...',
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.h)
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    showSortList
                        ? Positioned(
                            right: 5.w, top: 350.h, child: CardListSort())
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardListSort() {
    return SizedBox(
      width: 200.w,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            _myRadioButton(
              title: 'NEWEST',
              value: 0,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            _myRadioButton(
              title: 'PRICE (LOW TO HIGH)',
              value: 1,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            _myRadioButton(
              title: 'PRICE (HIGH TO LOW)',
              value: 2,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            _myRadioButton(
              title: 'BEDS (LEAST)',
              value: 3,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            _myRadioButton(
              title: 'BEDS (MOST)',
              value: 4,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            _myRadioButton(
              title: 'AREA (LOW TO HIGH)',
              value: 5,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            _myRadioButton(
              title: 'AREA (HIGH TO LOW)',
              value: 6,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
            SizedBox(height: 10.h),
            CustomeBtn(
              pressBtn: () {},
              title: 'Apply',
              btnColor: Colors.grey.shade700,
              heightBtn: 38.h,
              widthBtn: 110.w,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _myRadioButton(
      {required String title,
      String? image,
      required int value,
      double fontSize = 12,
      Color fontColor = Colors.grey,
      bool isSelected = true,
      required ValueChanged? onChanged}) {
    return SizedBox(
      height: 35.h,
      child: RadioListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        value: value,
        groupValue: _groupValue,
        onChanged: onChanged,
        visualDensity: VisualDensity(horizontal: -4.0),
        dense: true,
        title: Row(
          children: [
            isSelected == false
                ? Image.asset(
                    image!,
                    width: 25.w,
                    height: 25.h,
                  )
                : SizedBox(),
            CustomeText(
              title: title,
              fontSize: fontSize.sp,
              color: fontColor,
              fontWeight: FontWeight.w900,
            ),
          ],
        ),
      ),
    );
  }

}
