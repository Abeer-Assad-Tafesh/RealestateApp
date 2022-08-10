import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/widget/shared_components.dart';

import '../../core/app_colors.dart';

Widget custom_divider() {
  return Divider(
    thickness: 1.5.h,
    indent: 30.w,
    endIndent: 30.w,
    height: 10.h,
  );
}

Widget Custom_Drawer() {
  TextEditingController textEditingController=new TextEditingController();
  return Drawer(
    backgroundColor: kBackGroundApp,
    child: ListView(
      children: <Widget>[
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
                          Text('WILLIAM WALLAS'),
                          SizedBox(
                            width: 20,
                          ),
                          Text('(User)'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('632 / 78'),
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

