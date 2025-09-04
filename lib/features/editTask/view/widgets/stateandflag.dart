import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/thiming/styles.dart';
import '../../../../../rescorce/assets_image.dart';
class Stateandflag extends StatelessWidget {
  const Stateandflag({super.key, required this.TextTypeOfTask, required this.TextTitel, this.photoUrl,  this.Image});
  final String TextTypeOfTask;
  final String TextTitel;
  final String? photoUrl;
  final ImageProvider? Image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit:BoxFit.cover,
                  image:Image?? const AssetImage(AssetImages.RegisterandloginImage)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                )
              ]
          ),
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextTypeOfTask,style: AppStyel.style2,maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text(TextTitel,style: AppStyel.style2,maxLines: 2,overflow: TextOverflow.ellipsis,)
            ],
          ),
        )
      ],
    );
  }
}
