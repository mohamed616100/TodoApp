import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/core/widget/Bottom_widget.dart';
import 'package:todooappnit/features/home/view/widget/profile_widget.dart';
import 'package:todooappnit/features/profile/view/widgets/items.dart';
import 'package:todooappnit/features/profile/view/widgets/profile_shimmer.dart';
import '../../../core/routs/Routs.dart';
import '../../../core/thiming/color.dart';
import '../../../rescorce/asset_icons.dart';
import '../../home/manager/user_cubit/cubit.dart';
import '../../home/manager/user_cubit/user_state.dart';
import '../manger/cubit.dart';
import '../manger/state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogOutCubit(),
    ),
          BlocProvider(
            create: (context) => UserCubit()..getuserdata(),
          ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state){
                  if(state is LodingStatee){
                    return ProfileShimmer();
                  }else if (state is  ErrorStatee){
                    return Text(state.message);
                  }else if (state is SuccessStatee){
                    return ProfileWidget(
                      username: state.userModel.displayName??"gust",
                      image:state.userModel.photoUrl!=null
                          ? NetworkImage(state.userModel!.photoUrl!):
                          null
                    );
                  }else{
                    return Container();
                  }


                },
              ),
              SizedBox(height: 37.h,),
              items(
                Icon: AssetIcons.profileIcon,
                text: "Profile",
                color: Appcolors.primarycolor,
                Background: Appcolors.lightGrey,
                onPressed: () {
                  context.PushName(Routs.UpdateProfileScreen,);
                },
              ),
              SizedBox(height: 25.h,),
              items(
                  Icon: AssetIcons.lockIcon,
                  text: "Change Password",
                  color: Appcolors.primarycolor,
                  Background: Appcolors.lightGrey,
                  onPressed: () {
                    context.PushName(Routs.changePassScreen);
                  }),
              SizedBox(height: 25.h,),

              items(
                  Icon: AssetIcons.stting,
                  text: "Settings",
                  color: Appcolors.primarycolor,
                  Background: Appcolors.lightGrey,
                  onPressed: () {
                    context.PushName(Routs.SittingsScreen);
                  }),
              SizedBox(height: 150.h,),
              BlocListener<LogOutCubit, LogOutState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is SuccessState) {
                    context.pushAndRemoveUntil(Routs.SigninScreen);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)));
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)));
                  }
                },
                child: Builder(
                    builder: (context) {
                      return BottomWidget(
                          text: "Logout", color: Colors.red, onTap: () {
                        BlocProvider.of<LogOutCubit>(context).Logout();
                      }
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
