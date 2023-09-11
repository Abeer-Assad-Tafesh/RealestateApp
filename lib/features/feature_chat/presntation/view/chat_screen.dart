import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:real_state/core/app_size.dart';
import 'package:real_state/features/feature_chat/presntation/widget/card_message.dart';
import 'package:real_state/features/feature_chat/presntation/widget/card_person.dart';
import 'package:real_state/features/feature_chat/presntation/widget/message.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:real_state/features/widget/custome_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        text: 'Yes sure!',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'Are You sure!',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 2)),
        isSentByMe: true),
    Message(
        text: 'Yes sure!',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: false),
    Message(
        text: 'Are You sure!',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
        isSentByMe: true),
    Message(
        text: 'Yes sure!',
        date: DateTime.now().subtract(Duration(days: 2, minutes: 5)),
        isSentByMe: false),
    Message(
        text: 'Are You sure!',
        date: DateTime.now().subtract(Duration(days: 2, minutes: 6)),
        isSentByMe: true),
    Message(
        text: 'Yes sure!',
        date: DateTime.now().subtract(Duration(days: 2, minutes: 7)),
        isSentByMe: false),
    Message(
        text: 'Are You sure!',
        date: DateTime.now().subtract(Duration(days: 2, minutes: 8)),
        isSentByMe: true),
    Message(
        text: 'Yes sure!',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 9)),
        isSentByMe: false),
    Message(
        text: 'Are You sure!',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 10)),
        isSentByMe: true),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
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
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlaceDetails()));
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
              Row(
                children: [
                  SizedBox(width: 15.w),
                  CustomeText(
                    title: 'CHAT ROOM',
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
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
                          top: 15.h,
                          start: 10.w,
                          end: 10.w,
                          bottom: 15.h,
                        ),
                        child: Column(
                          children: [
                            CardPerson(
                              title: 'Gold Company',
                              supTitle: 'From: Kelly Gunter',
                              showWidget: false,
                            ),
                            SizedBox(height: 15.h),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:
                                            GroupedListView<Message, DateTime>(
                                          padding: EdgeInsets.all(8.w),
                                          reverse: true,

                                          order: GroupedListOrder.DESC,
                                          useStickyGroupSeparators: true,
                                          floatingHeader: true,
                                          elements: messages,
                                          groupBy: (message) => DateTime(
                                            message.date.year,
                                            message.date.month,
                                            message.date.day,
                                          ),
                                          groupHeaderBuilder:
                                              (Message message) => SizedBox(
                                            height: 40.h,
                                            child: Center(
                                              child: Card(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: CustomeText(
                                                    title: DateFormat.yMMMd()
                                                        .format(message.date),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          itemBuilder:
                                              (context, Message message) =>
                                                  Align(
                                            alignment: message.isSentByMe
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: Card(
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: message.isSentByMe
                                                      ? Radius.circular(25.w)
                                                      : Radius.circular(40.w),
                                                  bottomRight: message
                                                          .isSentByMe
                                                      ? Radius.circular(40.w)
                                                      : Radius.circular(25.w),
                                                  topLeft: message.isSentByMe
                                                      ? Radius.circular(25.w)
                                                      : Radius.zero,
                                                  topRight: message.isSentByMe
                                                      ? Radius.zero
                                                      : Radius.circular(25.w),
                                                ),
                                              ),
                                              color: message.isSentByMe
                                                  ? Color(0xff7679EA)
                                                  : Colors.white,
                                              child: Padding(
                                                padding: EdgeInsets.all(12.w),
                                                child: CustomeText(
                                                  title: message.text,
                                                  color: message.isSentByMe?Colors.white:Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CardMessage(
                                        preffix: Container(
                                          padding: EdgeInsets.all(13.w),
                                          child: Image.asset(
                                            'assets/images/microphone_chat.png',
                                            width: 20.w,
                                            height: 20.h,
                                            color: Color(0xff7679EA),
                                          ),
                                        ),
                                        suffix: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/smile_chat.jpeg',
                                              width: 20.w,
                                              height: 20.h,
                                            ),
                                            SizedBox(width: 7.w),
                                            Image.asset(
                                              'assets/images/image.png',
                                              width: 20.w,
                                              height: 20.h,
                                              color: Color(0xff7679EA),
                                            ),
                                            SizedBox(width: 7.w),
                                            Card(
                                                color: Color(0xff7679EA),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    'assets/images/send_chat.png',
                                                    width: 20.w,
                                                    height: 20.h,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        onSubmitted: (text) {
                                          final message = Message(
                                              text: text,
                                              date: DateTime.now(),
                                              isSentByMe: true);
                                          setState(() {
                                            messages.add(message);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
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
