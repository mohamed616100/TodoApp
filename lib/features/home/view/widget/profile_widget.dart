import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/thiming/styles.dart';
import '../../../../rescorce/assets_image.dart';
import '../../../../translation/transliton_kay.dart';
import '../../../Lets_Start/view/widget/Text_letsStart.dart';
class ProfileWidget extends StatelessWidget {
   ProfileWidget({super.key, this.onTap, required this.username, this.image,});
   final void Function()? onTap;
   final String username;
   final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InkWell(
            onTap:onTap ,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                image:  DecorationImage(fit: BoxFit.cover,
                    image:image??AssetImage(AssetImages.RegisterandloginImage) ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 16.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextLetsstart(text: TranslationKeys.hello,style: AppStyel.StyleLetsStart2,),
                Text(username,style: AppStyel.StyleLetsStart1,),

              ],
            ),
          )
        ],
      ),
    );
  }
}
