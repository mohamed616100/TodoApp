import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../thiming/color.dart';
import '../thiming/styles.dart';
class Textformfaild extends StatelessWidget {
  Textformfaild({super.key,
    required this.obscureText,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    required this.hintText,
    this.maxLines,
    required this.readOnly,
    this.OnTap,
    this.enabel,

  });
   Widget ?prefixIcon;
   bool ?enabel;
  final bool obscureText;
  final TextInputType keyboardType;
  Widget ?suffixIcon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  final String hintText;
  final int? maxLines;
  final bool readOnly;
  void Function()? OnTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:63.h ,
      width: 331.w,
      child: TextFormField(
        style: AppStyel.StyleLetsStart2.copyWith(
            color: Appcolors.blackcolor,
            fontWeight: FontWeight.w300
        ),
        onTap: OnTap,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: "*",
        maxLines: maxLines,
        readOnly: readOnly ,
        enabled: enabel,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Appcolors.lightGrey,
                  width: 1.w
              )
          ) ,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.greenAccent,
                  width: 2.w
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
