import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/layout.dart';
import 'package:real_state/features/widget/shared_components.dart';

import '../../../../core/app_size.dart';
import '../../../widget/custome_text.dart';
import 'owner_details.dart';


class Upload_Owner_Details extends StatefulWidget {
   Upload_Owner_Details({Key? key}) : super(key: key);

  @override
  State<Upload_Owner_Details> createState() => _Upload_Owner_DetailsState();
}
@override

class _Upload_Owner_DetailsState extends State<Upload_Owner_Details> {
TextEditingController companyNameEditingController=TextEditingController();
TextEditingController agentNameEditingController=TextEditingController();

TextEditingController mobnumberEditingController=TextEditingController();
TextEditingController telnumberEditingController=TextEditingController();

TextEditingController emailEditingController=TextEditingController();

TextEditingController addressEditingController=TextEditingController();

TextEditingController timeEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return ScreenLayout(
        context,
        ScreenWidget:
    Column(
    children: [

    Expanded(
    child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
    child: Column(
    children: [
    SizedBox(height: 20,),
    CustomeText(
    title: 'property'.toUpperCase(),
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade700,
    textAlign: TextAlign.center,
    ),

    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    CustomeText(
    title: 'contact details'.toUpperCase(),
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade700,
    textAlign: TextAlign.center,
    ),
    SizedBox(width: 20.w),

    Card(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Image.asset('assets/images/addImage.png',width: 40,height: 40,),
    ),
    //shadowColor: Colors.black12,
    // margin: EdgeInsets.all(10),
    ),
    SizedBox(width: 10.w),
    ],
    ),

    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
    children: [



    defaultTextForm(textEditingController: companyNameEditingController, textInputType: TextInputType.text,
    iconData: Icons.account_balance_outlined,
    label: 'Company Name'),

    defaultTextForm(textEditingController: agentNameEditingController, textInputType: TextInputType.text,
    iconData: Icons.person_outline,
    label: 'Agent Name'),

    defaultTextForm(textEditingController: mobnumberEditingController, textInputType: TextInputType.number,
    iconData: Icons.phone_android_outlined,
    label: 'Mobile Number'),

    defaultTextForm(textEditingController: telnumberEditingController, textInputType: TextInputType.number,
    iconData: Icons.phone_outlined,
    label: 'Tel Number'),

    defaultTextForm(textEditingController: emailEditingController, textInputType: TextInputType.emailAddress,
    iconData: Icons.email_outlined,
    label: 'Email Address'),

    defaultTextForm(textEditingController: addressEditingController, textInputType: TextInputType.streetAddress,
    iconData: Icons.location_on_outlined,
    label: 'Office Address'),

    defaultTextForm(textEditingController: timeEditingController, textInputType: TextInputType.number,
    iconData: Icons.watch_later_outlined,
    label: 'Office Hours'),
    SizedBox(height: 20.h,),
    Container(
    width: 120.w,
    height: 50.w,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Color(0xff6EB3D0),
    minimumSize: Size(120.w, 50.h),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.w),
    )),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    OwnerDetails()));
    },
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    CustomeText(
    title: 'Save',
    fontSize: 18.sp,
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
    ),
    SizedBox(height: 20.h,),
    ],
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ))
    ;
  }
}
