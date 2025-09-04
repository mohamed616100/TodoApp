import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/routs/Routs.dart';
import '../../../../core/thiming/color.dart';
import '../../../../core/thiming/styles.dart';
import '../../../../rescorce/asset_icons.dart';
import '../../../../rescorce/assets_image.dart';
import '../../../add_task/data/models/Taskmodel.dart';
import 'package:todooappnit/core/helper/extantion.dart';

class ViewtaskItem extends StatelessWidget {
  const ViewtaskItem({super.key, required this.taskmodel});
  final Taskmodel taskmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: () {
          context.PushName(Routs.EditTaskScreen, arguments: taskmodel);
        },
        child: Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
            color: Appcolors.primarycolor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:taskmodel.photoUrl != null?
                      NetworkImage(taskmodel.photoUrl!):
                      const AssetImage(AssetImages.RegisterandloginImage),
                    ),
                  ),
                ),
                SizedBox(width: 14.w),


                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        taskmodel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyel.style2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        taskmodel.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyel.style2.copyWith(
                          fontSize: 12.sp,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 14.sp, color: Colors.grey[600]),
                          SizedBox(width: 4.w),
                          Text(
                            "Due: ${taskmodel.date}",
                            style: AppStyel.style2.copyWith(
                              fontSize: 11.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: taskmodel.status == "Done"
                                  ? Appcolors.Scondarycolor
                                  : taskmodel.status == "In Progress"
                                  ? Colors.greenAccent
                                  : Colors.red,
                            ),
                            child: Text(
                              taskmodel.status,
                              style: AppStyel.style2.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),

                          Container(
                            width: 34.w,
                            height: 34.w,
                            decoration: BoxDecoration(
                              color: taskmodel.group == "Work"
                                  ? Appcolors.blackcolor
                                  : taskmodel.group == "Home"
                                  ? Colors.pink
                                  : Appcolors.Scondarycolor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                taskmodel.group == "Work"
                                    ? AssetIcons.Work
                                    : taskmodel.group == "Home"
                                    ? AssetIcons.Home
                                    : AssetIcons.person,
                                width: 18.w,
                                height: 18.h,
                                color: taskmodel.group == "Work"
                                    ? Appcolors.primarycolor
                                    : taskmodel.group == "Home"
                                    ? Appcolors.ligtppink
                                    : Appcolors.primarycolor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
