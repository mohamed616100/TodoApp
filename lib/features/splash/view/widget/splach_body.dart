import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/features/splash/view/widget/anumation_splach.dart';

import '../../../../core/routs/Routs.dart';
import '../../../../core/thiming/styles.dart';
import '../../../../rescorce/asset_icons.dart';
import '../../../../rescorce/assets_image.dart';
import '../../../../translation/transliton_kay.dart';
class SplachBody extends StatefulWidget {
   const SplachBody({super.key});

  @override
  State<SplachBody> createState() => _SplachBodyState();
}

class _SplachBodyState extends State<SplachBody> with SingleTickerProviderStateMixin{
   late AnumationSplach anumationSplach;
  @override
  void initState() {
    anumationSplach=AnumationSplach(vsync: this, duration: Duration(seconds: 2));
    anumationSplach.start();
    super.initState();
    gotoLetsStart();
  }
  @override
  void dispose() {
    anumationSplach.dispose();
    super.dispose();
  }
   gotoLetsStart(){
     Future.delayed(Duration(seconds: 3), ()
     {
       if(!mounted) return;
          context.PushReplacementName(Routs.LetsStartScreen);
     });

   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetIcons.SplachImage,
                width: double.infinity,
                height: 344.h,
              ),

              SizedBox(height: 44.06.h,),
              SlideTransition(
                position: anumationSplach.animation,
                  child: Text(TranslationKeys.TODO,style:AppStyel.StyleSplach,))
            ],
          ),
        ),

    );
  }
}
