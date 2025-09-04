import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/core/routs/Routs.dart';

import '../../../../../core/thiming/color.dart';
class ProgressTask extends StatelessWidget {
  const ProgressTask({super.key, required this.progress});
 final double progress ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135.h,
      decoration: BoxDecoration(
          color: Appcolors.Scondarycolor,
          borderRadius: BorderRadius.circular(30.r)
      ),
      padding: REdgeInsets.symmetric(
          horizontal: 22,
          vertical: 18
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Text( progress !=0.0?'Your today tasks almost done!':
              "no tasks completed for today",
            style: TextStyle(
                color: Appcolors.primarycolor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400

            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              Text('${progress.round()}%',style: TextStyle(
                  color: Appcolors.primarycolor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w500

              ),) ,

              InkWell(
                onTap: (){
                  context.PushName(Routs.ViewTaskScreen);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 36.h,
                  width: 121.w,
                  decoration: BoxDecoration(
                      color: Appcolors.primarycolor,
                    borderRadius: BorderRadius.circular(14.r)

                  ),
                  child: Text('View Tasks',style: TextStyle(
                      color: Appcolors.Scondarycolor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500

                  ),),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
