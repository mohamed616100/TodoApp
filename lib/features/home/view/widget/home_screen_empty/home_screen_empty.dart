import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/thiming/color.dart';
import '../../../../../core/thiming/styles.dart';
import '../../../../../rescorce/asset_icons.dart';
import '../../../../../translation/transliton_kay.dart';
import '../../../../Lets_Start/view/widget/Text_letsStart.dart';
class HomeScreenEmpty extends StatelessWidget {
  const HomeScreenEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 90.h,),
        TextLetsstart(text: TranslationKeys.Therearenotasksyet,style: AppStyel.StyleLetsStart2.copyWith(
          color: Appcolors.blackcolor,
        ),),
        TextLetsstart(text: TranslationKeys.Pressthebutton,style: AppStyel.StyleLetsStart2.copyWith(
          color: Appcolors.blackcolor,
        ),),
        TextLetsstart(text: TranslationKeys.Toaddnewtask,style: AppStyel.StyleLetsStart2.copyWith(
          color: Appcolors.blackcolor,
        ),),
        SvgPicture.asset(AssetIcons.homeIcon,
          width: double.infinity,
          height: 225.h,
        ),
      ],
    );
  }
}
