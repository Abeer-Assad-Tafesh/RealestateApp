import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/feature_place_details/presntation/view/full_image.dart';
import 'package:real_state/features/widget/custome_text.dart';

class PropertyLeaseContractScreen extends StatefulWidget {
  const PropertyLeaseContractScreen({Key? key}) : super(key: key);

  @override
  State<PropertyLeaseContractScreen> createState() =>
      _PropertyLeaseContractScreenState();
}

class _PropertyLeaseContractScreenState
    extends State<PropertyLeaseContractScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              CustomeText(
                title: 'Property lease contract',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                  child: Card(
                      elevation: 5, child: Image.asset('assets/images/map.jpeg')
                      /*CustomeText(
                        title: 'Show property blue print',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),*/
                      ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FullImageScreen(
                              image: 'assets/images/map.jpeg')))),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                  child: Card(
                      elevation: 5, child: Image.asset('assets/images/map.jpeg')
                      /*CustomeText(
                        title: 'Show property contract',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),*/
                      ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FullImageScreen(
                              image: 'assets/images/map.jpeg'))))
            ],
          ),
        ),
      ),
    ));
  }
}
