import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/thiming/styles.dart';
class CountinerTypeofwork extends StatelessWidget {
  const CountinerTypeofwork({super.key,
    required this.onTap,
    required this.colortext, required this.colorbackground, required this.text, required this.width});
   final Color colortext;
   final Color colorbackground;
   final double width;
   final String text;
   final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 28.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: colorbackground,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(text,style: AppStyel.style2.copyWith(
          color:colortext,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,

        )),
      ),
    );
  }
}
