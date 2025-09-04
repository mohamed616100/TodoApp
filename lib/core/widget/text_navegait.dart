import 'package:flutter/material.dart';

import '../thiming/color.dart';
import '../thiming/styles.dart';
class TextNavegait extends StatelessWidget {
   TextNavegait ({super.key, required this.text1, required this.textbottom, required this.onTap});
    final String text1;
    final String textbottom;
    final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$text1",style: AppStyel.StyleLetsStart2,),
        GestureDetector(
          onTap:onTap ,
          child: Text("  $textbottom",style: AppStyel.StyleLetsStart2.copyWith(
            color: Appcolors.blackcolor,
          ),),
        ),
      ],
    );
  }
}
