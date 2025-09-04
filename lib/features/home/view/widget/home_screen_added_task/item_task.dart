import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/features/add_task/data/models/Taskmodel.dart';
import '../../../../../core/thiming/color.dart';
import '../../../../../core/thiming/styles.dart';
import '../../../../../rescorce/asset_icons.dart';
class ItemTask extends StatelessWidget {
  const ItemTask({super.key, required this.taskes, });
 final Taskmodel taskes;
  Color getGroupColor(String group) {
    switch (group) {
      case "Home":
        return Appcolors.ligtppink;
      case "Work":
        return Appcolors.blackcolor;
      default:
        return Appcolors.sky;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 14.w),
      child: Container(
        width: 234.w,
        height: 90.h,
        decoration: BoxDecoration(
            color:getGroupColor(taskes.group),
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(taskes.group,style: AppStyel.StyleLetsStart2,),
                  Container(
                    alignment: Alignment.center,
                    height: 22.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color:taskes.group=="Home"?Appcolors.ligtppink:Appcolors.Scondarycolor,),
                    child: SvgPicture.asset(  taskes.group == "Work"?AssetIcons.Work:taskes.group == "Home"?AssetIcons.Home:AssetIcons.profileIcon,
                  )
                  )
                ],
              ),
              Expanded(
                child: Text(taskes.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,style: taskes.group=="Work"?
                    AppStyel.Scfoold.copyWith(
                      fontSize: 14,
                      color: Appcolors.primarycolor
                    ):AppStyel.Scfoold.copyWith(
                      fontSize: 14
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
