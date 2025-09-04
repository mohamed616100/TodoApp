import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Numberoftask extends StatelessWidget {
  const Numberoftask({super.key, required this.width, required this.height,  required this.text, required this.color, required this.Background});
   final double width;
   final double height;
   final String text;
   final Color color;
   final Color Background;
  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color:Background,
          ),
          child: Text(text,style: TextStyle(
              color: color
          ),)
    );
  }
}
