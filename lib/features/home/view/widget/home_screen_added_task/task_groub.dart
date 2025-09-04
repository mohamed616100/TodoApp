import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/thiming/color.dart';
import '../../../../../core/thiming/styles.dart';
import 'numberoftask.dart';
class TaskGroub extends StatelessWidget {
  const TaskGroub({super.key,
    required this.text,
    required this.number, required this.color, required this.Background,required this.Icon,});
    final String Icon;
    final String text;
    final String number;
    final Color color;
    final Color Background;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 63.h,
      decoration: BoxDecoration(
        color: Appcolors.primarycolor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Background,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: IconButton(onPressed: (){}, icon: SvgPicture.asset(
                  Icon,width: 19.w,height: 21,color: color,)),),
            SizedBox(width: 11.w,),
            Text(text,style: AppStyel.Scfoold,),
            Spacer(),
            Numberoftask(width: 22, height: 22, text: number, color: color, Background: Background)


          ],
        ),
      ),
    );
  }
}
