import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/thiming/styles.dart';
import '../../../../rescorce/asset_icons.dart';
class SearchWidget extends StatelessWidget {
   SearchWidget({super.key, required this.controller, required this.onChanged});
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller:controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: "Search . . .",
                hintStyle: AppStyel.StyleLetsStart2,
                border: InputBorder.none,

              ),
            ),
          ),
          IconButton(onPressed: (){
            onChanged(controller.text);
          }, icon: SvgPicture.asset(AssetIcons.search)),
        ],
      ),
    );
  }
}