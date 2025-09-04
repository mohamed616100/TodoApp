import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/core/thiming/styles.dart';
import '../../../../core/routs/Routs.dart';
import '../../../../core/widget/Bottom_widget.dart';
import '../../../../rescorce/asset_icons.dart';
import '../../../../translation/transliton_kay.dart';
import 'Text_letsStart.dart';
class LetsStartScreenBody extends StatelessWidget {
  const LetsStartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical:30 ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(AssetIcons.letsStart,
              width: double.infinity,
              height: 342.h,
            ),
            Column(
              children: [
                TextLetsstart(text: TranslationKeys.WelcomeTo,style: AppStyel.StyleLetsStart1,),
                TextLetsstart(text: "${TranslationKeys.DoIt} !",style: AppStyel.StyleLetsStart1),
              ],
            ),

            Column(
              children: [
                TextLetsstart(text: TranslationKeys.Readytoconquer,style: AppStyel.StyleLetsStart2),
                TextLetsstart(text: TranslationKeys.Ittogether,style: AppStyel.StyleLetsStart2),
              ],
            ),

            BottomWidget(text: TranslationKeys.LetsStart, onTap: () {
              context.pushAndRemoveUntil(FirebaseAuth.instance.currentUser == null ? Routs.SigninScreen : Routs.HomeScreen);
            }),

          ],
        ),
      ),
    );
  }
}
