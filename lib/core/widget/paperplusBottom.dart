import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/core/thiming/color.dart';

import '../../rescorce/asset_icons.dart';
class BaberPlusBouttom extends StatelessWidget {
  const BaberPlusBouttom ({super.key, required this.Icon,
    required this.onPressed});
  final String Icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Appcolors.Scondarycolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(Icon),
      ),
    );
  }
}
