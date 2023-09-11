import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_state/features/feature_home/presntation/view/home_screen.dart';
import 'package:real_state/features/feature_owner/presntation/view/owner_screen.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:real_state/features/feature_search_property/presntation/view/search_property.dart';
import 'package:real_state/features/features_filter/presntation/view/filter_screen.dart';
import 'package:real_state/features/features_owner_details/presntation/view/owner_details.dart';

import 'core/app_colors.dart';
import 'features/deep_link/dynamic_link_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  DynamicLinksService dls = DynamicLinksService();

  @override
  void initState() {
    super.initState();
    dls.initDynamicLinks();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetMaterialApp(
      /*initialRoute:'/search_property',
      routes: {
        '/rniX' : (context) => PlaceDetails(),
        '/search_property' : (context) =>  SearchProperty(),
      },*/
      home: SearchProperty(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: kColorLightBlue,
            secondary: kColorLightBlue
        ),
      ),
      debugShowCheckedModeBanner: false,

    );
  }

}

