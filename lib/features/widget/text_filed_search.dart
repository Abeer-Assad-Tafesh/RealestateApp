
import 'package:flutter/material.dart';
import 'package:real_state/core/app_colors.dart';
import 'package:real_state/core/app_font.dart';
import 'package:real_state/core/app_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextFiledSearch extends StatefulWidget {
  late TextEditingController searchQuery;
  ValueChanged<String>? onSubmitted;
  FocusNode ? focusNode ;
  GestureTapCallback ?pressClose;
  String? imageSearch;
  int? widthImageSearch;
  int? heightImageSearch;

      TextFiledSearch({Key? key,required this.searchQuery,this.pressClose,this.onSubmitted,this.focusNode,this.imageSearch = 'assets/images/searchHouse.png',this.heightImageSearch = 30,this.widthImageSearch = 30}) : super(key: key);

  @override
  State<TextFiledSearch> createState() => _TextFiledSearchState();
}

class _TextFiledSearchState extends State<TextFiledSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: kSearchFiledColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: TextField(
        maxLines: 1,
        minLines: 1,
          autofocus:false,
        // enabled: false,
        style:const TextStyle(
            color: kTextColor,
            fontFamily: FONT_APP,
            fontSize: fontSize13),
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSubmitted,
        focusNode: widget.focusNode,

        controller: widget.searchQuery,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(

          hintText:'Gaza , Palestine',
          filled: true,
          fillColor: Colors.white,

          prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 5, left: 8),
            child: Image.asset(widget.imageSearch!,width: widget.widthImageSearch!.w,height: widget.heightImageSearch!.h,)//SvgPicture.asset(ICON_SEARCH,color: Colors.white,),
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
          suffixIcon: GestureDetector(
            onTap: widget.pressClose,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.close,
                color: widget.searchQuery.text.isEmpty
                    ? Colors.transparent
                    : /*kUnSelectTabColor*/Colors.white,
              ),
            ),
          ),

          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          border:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: 0.5)),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: 0.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: 0.5)),
          disabledBorder:InputBorder.none,


          hintStyle: TextStyle(
              color: kBorderColor,
              fontFamily: FONT_APP,
              fontSize: fontSize15),
        ),
        textAlign: TextAlign.start,
      ),
    );;
  }
}
