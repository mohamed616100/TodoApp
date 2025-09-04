import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todooappnit/rescorce/asset_icons.dart';
import '../../../core/thiming/color.dart';
import '../../../core/thiming/styles.dart';
import '../manager/cubit/cubit.dart';
import '../manager/cubit/state.dart';
class SittingsScreen extends StatefulWidget {
  const SittingsScreen({super.key});

  @override
  State<SittingsScreen> createState() => _SittingsScreenState();
}

class _SittingsScreenState extends State<SittingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => togellcubit(),
      child: BlocBuilder<togellcubit,togellstate>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Appcolors.background,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(AssetIcons.arrowback),
              ),
              title: Text("Sittings", style: AppStyel.Scfoold),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Language", style: AppStyel.Scfoold),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => togellcubit.get(context).changeLanguage("AR"),
                        child: Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 51.w,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color:  togellcubit.get(context).selectedLang == "AR"
                                ? Appcolors.Scondarycolor
                                : Appcolors.lightGrey,
                          ),
                          child: Text(
                            "AR",
                            style: AppStyel.Scfoold.copyWith(
                              color: togellcubit.get(context).selectedLang == "AR"
                                  ? Appcolors.primarycolor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => togellcubit.get(context).changeLanguage("EN"),
                        child: Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 51.w,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: togellcubit.get(context).selectedLang == "EN"
                                ? Appcolors.Scondarycolor
                                : Appcolors.lightGrey,
                          ),
                          child: Text(
                            "EN",
                            style: AppStyel.Scfoold.copyWith(
                              color: togellcubit.get(context).selectedLang == "EN"
                                  ? Appcolors.primarycolor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
