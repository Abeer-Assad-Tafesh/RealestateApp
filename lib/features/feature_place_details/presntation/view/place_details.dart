import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:real_state/features/feature_owner/presntation/widget/alert_dialog_details.dart';
import 'package:real_state/features/feature_place_details/presntation/view/map.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/card_blue_print.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/card_camera_place_details.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/card_details_place_details.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/card_more_details_place_details.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/card_type_nearby.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/item_place_details.dart';
import 'package:real_state/features/feature_place_details/presntation/widget/item_title_space_details.dart';
import 'package:real_state/features/features_owner_details/presntation/view/owner_details.dart';
import 'package:real_state/features/widget/custome_btn.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {

  PageController? controller1;
  PageController? controller2;
  int selectedImage = 0;
  bool showMap = false;
  bool showDirections = false;
  bool showVideo = false;
  bool showNearby = false;
  bool showBluePrint = false;
  bool isSelectedNearby1 = false;
  bool isSelectedNearby2 = false;
  bool isSelectedNearby3 = false;
  bool isSelectedMap = true;
  bool isSelectedDirection = false;
  bool isSelectedDisplay = false;
  String? mapImage;

  Color directionTextIconColor = Colors.grey.shade600;
  Color viewMapTextIconColor = Colors.blue;



  var listImages = [
    'assets/images/place1.png',
    'assets/images/place2.jpg',
    'assets/images/place3.png',
    'assets/images/place4.png',
    'assets/images/place5.png'
  ];

  var listMapImages = [
    'assets/images/map1.jpg',
    'assets/images/map2.jpg',
    'assets/images/map3.jpg',
  ];

  var listHomeIcons = [
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
    'assets/images/bath.png',
  ];

  var listHomeDetails = [
    '2 Bath', '3 Beds', '4 Rooms',
    '2 Bath', '3 Beds', '4 Roomshgkhghjmgh',
    '2 Bath', '3 Beds', '4 Roomsgjfgfhg'
  ];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1 = PageController();
    controller2 = PageController();
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
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              showMap = false;
              showVideo = false;
              showNearby = false;
              showBluePrint = false;
              isSelectedDisplay =false;
            });
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(width: 15.w),
                            Image.asset(
                              'assets/images/notifcation.png',
                              width: 30.w,
                              height: 30.h,
                            ),
                            Spacer(),
                            Image.asset(
                              'assets/images/logoApp.png',
                              width: 80.w,
                              height: 80.h,
                            ),
                            Spacer(),
                            Image.asset(
                              'assets/images/menu.png',
                              width: 30.w,
                              height: 30.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250.h,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                      controller: controller1,
                                      itemCount: listImages.length,
                                      clipBehavior: Clip.antiAlias,
                                      onPageChanged: (index) {
                                        setState(() {
                                          selectedImage = index;
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        String listImage =
                                        listImages.elementAt(index);
                                        return Image.asset(
                                          listImage,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          isAntiAlias: true,
                                        );
                                      }),
                                  Row(
                                    children: [
                                      SizedBox(width: 5.w),
                                      Column(
                                        children: [
                                          SizedBox(height: 15.h),
                                          CardCameraPlaceDetails(
                                              image: 'assets/images/camera.png',
                                              title: '8'),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showVideo = true;
                                              });
                                              // Navigator.push(context, MaterialPageRoute(builder:
                                              //     (context) => VideoPlayerScreen()));
                                            },
                                            child: CardCameraPlaceDetails(
                                                image: 'assets/images/video.png',
                                                title: '3'
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          CardMoreDetailsPlaceDetails(
                                              image: 'assets/images/call.png'),
                                          CardMoreDetailsPlaceDetails(
                                            image: 'assets/images/chat.png',
                                            pressCard: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatScreen()));
                                            },
                                          ),
                                          CardMoreDetailsPlaceDetails(
                                              image:
                                              'assets/images/favorite.png'),
                                          CardMoreDetailsPlaceDetails(
                                              image: 'assets/images/share.png'),
                                          SizedBox(width: 5.w),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 5.h,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Card(
                                          color: Colors.white.withOpacity(0.4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(30.r),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 10.h),
                                            child: SmoothPageIndicator(
                                                controller: controller1!,
                                                // PageController
                                                count: listImages.length,
                                                effect: WormEffect(
                                                    dotWidth: 10.0.w,
                                                    dotHeight: 10.0.w,
                                                    activeDotColor: Colors
                                                        .blue),
                                                // your preferred effect
                                                onDotClicked:
                                                    (_currentLocation) {}),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 1.5.h,
                              indent: 30.w,
                              endIndent: 30.w,
                              height: 10.h,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                SizedBox(width: 15.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelectedMap = true;
                                      isSelectedDirection = false;
                                      viewMapTextIconColor = Colors.blue;
                                      directionTextIconColor =
                                          Colors.grey.shade600;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: const[
                                        BoxShadow(
                                            blurRadius: 0.3,
                                            spreadRadius: 0.0,
                                            offset: Offset(0.5, 0.5)
                                        ),
                                      ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/location.png',
                                            width: 24.w,
                                            height: 24.h,
                                            color: viewMapTextIconColor,
                                          ),
                                          SizedBox(width: 6.w),
                                          CustomeText(
                                            title: 'View Map',
                                            color: viewMapTextIconColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 50.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelectedDirection = true;
                                      isSelectedMap = false;
                                      directionTextIconColor = Colors.blue;
                                      viewMapTextIconColor =
                                          Colors.grey.shade600;
                                      showDirections = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5.0),
                                        boxShadow: const[
                                          BoxShadow(
                                              blurRadius: 0.3,
                                              spreadRadius: 0.0,
                                              offset: Offset(0.5, 0.5)
                                          ),
                                        ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.car_repair,
                                            color: directionTextIconColor,),
                                          /* Image.asset(
                                            'assets/images/location.png',
                                            width: 30.w,
                                            height: 30.h,
                                          ),*/
                                          SizedBox(width: 6.w),
                                          CustomeText(
                                            title: 'Directions',
                                            color: directionTextIconColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 250.h,
                              child: Stack(
                                children: [
                                  /*Image.asset(
                                    'assets/images/map.jpeg',
                                    width: double.infinity,
                                    height: 250.h,
                                    fit: BoxFit.cover,
                                  ),*/
                                  isSelectedMap
                                      ? Stack(
                                    children: [
                                      PageView.builder(
                                          controller: controller2,
                                          itemCount: listMapImages.length,
                                          clipBehavior: Clip.antiAlias,
                                          onPageChanged: (index) {
                                            setState(() {
                                              selectedImage = index;
                                            });
                                          },
                                          itemBuilder: (context, index) {
                                            String listImage =
                                            listMapImages.elementAt(index);
                                            return Image.asset(
                                              listImage,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              isAntiAlias: true,
                                            );
                                          }),
                                      Positioned(
                                        bottom: 5.h,
                                        right: 0,
                                        left: 0,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Card(
                                              color: Colors.white.withOpacity(
                                                  0.4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(30.r),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 10.h),
                                                child: SmoothPageIndicator(
                                                    controller: controller2!,
                                                    // PageController
                                                    count: listMapImages.length,
                                                    effect: WormEffect(
                                                        dotWidth: 10.0.w,
                                                        dotHeight: 10.0.w,
                                                        activeDotColor: Colors
                                                            .blue),
                                                    // your preferred effect
                                                    onDotClicked:
                                                        (_currentLocation) {}),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                      :const MapScreen(),
                                  isSelectedMap
                                      ? Positioned(
                                    right: 5.w,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (showNearby == false) {
                                                showNearby = true;
                                              } else {
                                                showNearby = false;
                                                isSelectedNearby1 = false;
                                                isSelectedNearby2 = false;
                                                isSelectedNearby3 = false;
                                              }
                                            });
                                          },
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 12,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h,
                                                  horizontal: 5.w),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/arrowDown.png',
                                                    width: 10.w,
                                                    height: 10.h,
                                                  ),
                                                  SizedBox(width: 3.w),
                                                  Image.asset(
                                                    'assets/images/show_home.png',
                                                    //eye icon
                                                    width: 25.w,
                                                    height: 25.h,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        showNearby
                                            ? Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5.r),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10.h),
                                              CustomeText(
                                                title: 'NEARBY',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700,
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                children: [
                                                  SizedBox(width: 5.w),
                                                  CardTypeNearby(
                                                    title: 'HOSPITAL',
                                                    image:
                                                    'assets/images/hospital.png',
                                                    color: isSelectedNearby1
                                                        ? Colors.blue
                                                        : Colors.white,
                                                    textColor:
                                                    isSelectedNearby1
                                                        ? Colors.white
                                                        : Colors.black
                                                        .withOpacity(
                                                        0.5),
                                                    pressCard: () {
                                                      setState(() {
                                                        if (isSelectedNearby1 ==
                                                            false) {
                                                          isSelectedNearby1 =
                                                          true;
                                                          isSelectedNearby2 =
                                                          false;
                                                          isSelectedNearby3 =
                                                          false;
                                                        } else {
                                                          isSelectedNearby1 =
                                                          false;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  CardTypeNearby(
                                                    title: 'SCHOOL',
                                                    image:
                                                    'assets/images/school.png',
                                                    color: isSelectedNearby2
                                                        ? Colors.blue
                                                        : Colors.white,
                                                    textColor:
                                                    isSelectedNearby2
                                                        ? Colors.white
                                                        : Colors.black
                                                        .withOpacity(
                                                        0.5),
                                                    pressCard: () {
                                                      setState(() {
                                                        if (isSelectedNearby2 ==
                                                            false) {
                                                          isSelectedNearby1 =
                                                          false;
                                                          isSelectedNearby2 =
                                                          true;
                                                          isSelectedNearby3 =
                                                          false;
                                                        } else {
                                                          isSelectedNearby2 =
                                                          false;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  CardTypeNearby(
                                                    title: 'MALL',
                                                    image:
                                                    'assets/images/mall.png',
                                                    color: isSelectedNearby3
                                                        ? Colors.blue
                                                        : Colors.white,
                                                    textColor:
                                                    isSelectedNearby3
                                                        ? Colors.white
                                                        : Colors.black
                                                        .withOpacity(
                                                        0.5),
                                                    pressCard: () {
                                                      setState(() {
                                                        if (isSelectedNearby3 ==
                                                            false) {
                                                          isSelectedNearby1 =
                                                          false;
                                                          isSelectedNearby2 =
                                                          false;
                                                          isSelectedNearby3 =
                                                          true;
                                                        } else {
                                                          isSelectedNearby3 =
                                                          false;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(width: 5.w),
                                                ],
                                              ),
                                              SizedBox(height: 5.h),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 80.w,
                                                    child: CustomeBtn(
                                                      title: 'DISPLAY',
                                                      btnColor: isSelectedDisplay
                                                          ? Colors.grey.shade600
                                                          : Colors.blue,
                                                      fontSize: 12,
                                                      widthBtn: 45,
                                                      heightBtn: 30,
                                                      pressBtn: () {
                                                        setState(() {
                                                          isSelectedDisplay = true;
                                                          if (isSelectedNearby1) {
                                                            mapImage =
                                                                listMapImages
                                                                    .elementAt(0);
                                                            showMap = true;
                                                          } else
                                                          if (isSelectedNearby2) {
                                                            mapImage =
                                                                listMapImages
                                                                    .elementAt(1);
                                                            showMap = true;
                                                          } else
                                                          if (isSelectedNearby3) {
                                                            mapImage =
                                                                listMapImages
                                                                    .elementAt(2);
                                                            showMap = true;
                                                          } else {
                                                            showMap = false;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 15.w),
                                                  SizedBox(
                                                    width: 80.w,
                                                    child: CustomeBtn(
                                                      title: 'CANCEL',
                                                      btnColor: Colors.grey,
                                                      fontSize: 12,
                                                      widthBtn: 45,
                                                      heightBtn: 30,
                                                      pressBtn: () {
                                                        setState(() {
                                                          showNearby = false;
                                                          isSelectedNearby1 =
                                                          false;
                                                          isSelectedNearby2 =
                                                          false;
                                                          isSelectedNearby3 =
                                                          false;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                            : SizedBox(),
                                      ],
                                    ),
                                  )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ItemTitleSpaceDetails(
                              title: 'General',
                              btnText: 'Owner Details',
                              btnWidth: 120,
                              pressBtn: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OwnerDetails()));
                              },
                            ),
                            Column(
                              children: [
                                ItemPlaceDetails(
                                    title: 'Property Price :', text: '56000\$'),
                                ItemPlaceDetails(
                                  title: 'Property Address :',
                                  text: 'Central park,RAFAH,GAZA',
                                ),
                                ItemPlaceDetails(
                                  title: 'Property Condition :',
                                  text: 'Excellent',
                                ),
                                ItemPlaceDetails(
                                  title: 'Construction Year :',
                                  text: '2021',
                                ),
                                ItemPlaceDetails(
                                  title: 'Total Space :',
                                  text: '560 M',
                                ),
                                ItemPlaceDetails(
                                  title: 'Livable Space :',
                                  text: '350 M',
                                ),
                                ItemPlaceDetails(
                                  title: 'Visitable Data :',
                                  text: '25/03/2022',
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                            Divider(
                              thickness: 1.5.h,
                              indent: 30.w,
                              endIndent: 30.w,
                              height: 10.h,
                            ),
                            SizedBox(height: 5.h),
                            ItemTitleSpaceDetails(
                              pressBtn: () {
                                setState(() {
                                  if (showBluePrint == false) {
                                    showBluePrint = true;
                                  } else {
                                    showBluePrint = false;
                                  }
                                });
                              },
                              title: 'Description',
                              btnText: 'Property Blue Prints',
                              btnWidth: 160,
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: CustomeText(
                                title:
                                'Lorem Ipsum is simply dummy text of the printing'
                                    ' and typesetting industry. Lorem Ipsum has been'
                                    ' the industry\'s standard dummy text ever since'
                                    ' the 1500s,',
                                fontSize: 14.sp,
                                color: Colors.grey,
                                fontHeight: 1.4.h,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Divider(
                              thickness: 1.5.h,
                              indent: 30.w,
                              endIndent: 30.w,
                              height: 10.h,
                            ),
                            SizedBox(height: 5.h),
                            ItemTitleSpaceDetails(
                              title: 'Details',
                              showBtn: false,
                            ),
                            SizedBox(height: 15.h),
                            Column(
                              children: [
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: listHomeDetails.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0,
                                    childAspectRatio: 1 / 0.8,
                                  ),
                                  itemBuilder: (context, index) =>
                                      CardDetailsPlaceDetails(
                                          image: listHomeIcons[index],
                                          title: listHomeDetails[index]),
                                ),
                                SizedBox(height: 25.h),
                                Divider(
                                  thickness: 1.5.h,
                                  indent: 30.w,
                                  endIndent: 30.w,
                                  height: 10.h,
                                ),
                                SizedBox(height: 5.h),
                                SizedBox(
                                  width: 190.w,
                                  child: CustomeBtn(
                                    pressBtn: () {},
                                    title: 'Property Lease Contract',
                                    btnColor: Color(0xff6EB3D0),
                                    heightBtn: 35.h,
                                    widthBtn: 60.w,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 25.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  showBluePrint
                      ? Positioned(
                      top: 1020.h, right: 15.w, child: cardBluePrint())
                      : SizedBox(),
                  showVideo
                      ? Positioned(
                      top: 230.h, right: 1.w, left: 1.w,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    SizedBox();
                                  },
                                  child: CardCameraPlaceDetails(
                                      image: 'assets/images/video.png',
                                      title: '1#'
                                  ),
                                ),
                                CardCameraPlaceDetails(
                                    image: 'assets/images/video.png',
                                    title: '2#'
                                ),
                                CardCameraPlaceDetails(
                                    image: 'assets/images/video.png',
                                    title: '3#'
                                ),
                              ],
                            ),
                          ),
                          SizedBox(),
                        ],
                      )
                  )
                      : SizedBox(),
                  showMap
                      ? Positioned(
                      top: 500.h, right: 1.w, left: 1.w, child: cardMapImage())
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardBluePrint() {
    return SizedBox(
      width: 250.w,
      child: Card(
        elevation: 5,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      showBluePrint = false;
                    });
                  },
                  child: Image.asset(
                    'assets/images/cancel.png',
                    width: 35.w,
                    height: 35.h,
                  )),
              SizedBox(height: 5.h),
              CardBluePrint(
                title: 'BLUE PRINT TYPE A',
                pressBtnDisplay: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                    new AlertDialogDetailsFun(indexImage: 0),
                  );
                },
              ),
              CardBluePrint(
                title: 'BLUE PRINT TYPE B',
                pressBtnDisplay: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                    new AlertDialogDetailsFun(indexImage: 1),
                  );
                },
              ),
              CardBluePrint(
                title: 'BLUE PRINT TYPE C',
                pressBtnDisplay: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                    new AlertDialogDetailsFun(indexImage: 2),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardMapImage() {
    return SizedBox(
      width: 250.w,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    // showMap = false;
                  });
                },
                child: Image.asset(
                  mapImage!,
                )
            ),
          ],
        ),
      ),
    );
  }


}
