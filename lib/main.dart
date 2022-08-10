import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/feature_home/presntation/view/home_screen.dart';
import 'package:real_state/features/feature_owner/presntation/view/owner_screen.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:real_state/features/feature_search_property/presntation/view/search_property.dart';
import 'package:real_state/features/features_filter/presntation/view/filter_screen.dart';
import 'package:real_state/features/features_owner_details/presntation/view/owner_details.dart';


void main(){
  runApp(MainApp());
}



class MainApp extends StatefulWidget {


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchProperty(),
    );
  }
}

