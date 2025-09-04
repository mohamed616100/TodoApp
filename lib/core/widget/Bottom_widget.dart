import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/Lets_Start/view/widget/Text_letsStart.dart';
import '../thiming/color.dart';
import '../thiming/styles.dart';
class BottomWidget extends StatelessWidget {
   BottomWidget({super.key, required this.text, required this.onTap, this.color,});
  final String text;
  final Function() onTap;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:color??Appcolors.Scondarycolor,
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 5),
            )// changes position of shadow
          ],
          color: color??Appcolors.Scondarycolor,
          borderRadius: BorderRadius.circular(14),

        ),
        width: 331.w,
        height: 48.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLetsstart(
              text:text ,
              style:AppStyel.StyleLetsStart1.copyWith(
                fontSize: 19,
                color: Appcolors.primarycolor,),),
          ],
        ),
      ),
    );
  }
}
