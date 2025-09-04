import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../rescorce/assets_image.dart';
class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, this.image});
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 298.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        image: DecorationImage(
          image: image?? const AssetImage(AssetImages.RegisterandloginImage),
          fit: BoxFit.cover,
        ),
      ) ,
    );
  }
}
