import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/components.dart';
import 'package:real_state/features/widget/custome_text.dart';
import 'package:real_state/features/widget/shared_components.dart';

Widget Custom_Drawer() {
  TextEditingController textEditingController=new TextEditingController();
  return  Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: ExactAssetImage(
                            'assets/images/person_user.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomeText(
                            title: 'WILLIAM WALLAS'.toUpperCase(),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(
                            width: 10,
                          ),
                          CustomeText(
                            title: '(User)',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                            textAlign: TextAlign.center,
                          ),


                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      CustomeText(
                        title: '632 / 78',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              defaultTextForm(
                textEditingController: textEditingController,
                textInputType: TextInputType.text,
                iconData: Icons.search, )
            ],
          ),
        ),

        ListTile(
          leading: Icon(Icons.house_outlined),
          title: Text('Home'),
        ),
        ListTile(
          leading: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Icon(
                Icons.person_outline_outlined,
              ),
              Icon(Icons.edit_outlined, size: 20),
            ],
          ),
          title: Text('User Settings'),

        ),
        ListTile(
          leading: Icon(Icons.notifications_none),
          title: Text('Notifications'),
        ),
        ListTile(
          leading: Icon(Icons.chat_outlined),
          title: Text('Chat Messages'),
        ),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('Favorites'),
        ),
        custom_divider(),
        ListTile(
          leading: Icon(Icons.contact_support_outlined),
          title: Text('About Us'),
        ),
        ListTile(
          leading: Icon(Icons.phone_in_talk_outlined),
          title: Text('Contact Us'),
        ),
        ListTile(
          leading: Icon(Icons.share_outlined),
          title: Text('App Share'),
        ),
        ListTile(
          leading: Icon(Icons.star_border),
          title: Text('Evaluate'),
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip_outlined),
          title: Text('Privacy Policy'),
        ),
        ListTile(
          leading: Icon(Icons.app_shortcut_outlined),
          title: Text('App Usage'),
        ),
        custom_divider(),
        ListTile(
          leading: Icon(Icons.logout_outlined),
          title: Text('Log Out'),
        ),
      ],
    ),
  );
}


Widget ScreenLayout(context,  {required Widget ScreenWidget}){
  TextEditingController textEditingController=new TextEditingController();

  return SafeArea(

    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leadingWidth: 80,
        title: Container(
          width: 60.w,
          height: 60.h,
          child: Image.asset(
            'assets/images/logoApp.png',
            width: 50.w,
            height: 50.h,
          ),
        ) ,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.list,color: Colors.black54, size: 40,),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ),
        ],
        leading:


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Container(
                height: 30.h,
                // alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/back.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),*/

            IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications,color: Colors.black54,size: 30,),
            ),

          ],
        ),

      ),
      endDrawer:Custom_Drawer(),
      body: ScreenWidget
    ),
  );
}
Widget BackScreenLayout(context,  {required Widget ScreenWidget}){
  TextEditingController textEditingController=new TextEditingController();

  return SafeArea(

    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leadingWidth: 90,

        title: Container(
          width: 60.w,
          height: 60.h,
          child: Image.asset(
            'assets/images/logoApp.png',
            width: 50.w,
            height: 50.h,
          ),
        ) ,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.list,color: Colors.black54, size: 40,),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ),
        ],
        leading:


        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.h,
                // alignment: Alignment.topCenter,
                child:    GestureDetector(
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
                     color: Colors.black54,
                    ),
                  ),
                ),
              ),

              IconButton(
                onPressed: (){},
                icon: Icon(Icons.notifications,color: Colors.black54,size: 30,),
              ),

            ],
          ),
        ),

      ),
      endDrawer:Custom_Drawer(),
      body: ScreenWidget
    ),
  );
}