import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/features/Auth/signin/data/models/user_model.dart';
import 'package:todooappnit/features/home/view/widget/home_screen_added_task/home_screen_addedtask.dart';
import 'package:todooappnit/features/home/view/widget/profile_widget.dart';
import 'package:todooappnit/features/profile/view/widgets/profile_shimmer.dart';
import '../../../../core/routs/Routs.dart';
import '../../../../rescorce/asset_icons.dart';
import '../../../../core/widget/paperplusBottom.dart';
import '../../manager/user_cubit/cubit.dart';
import '../../manager/user_cubit/user_state.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key,});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
              if (state is LodingStatee){
                return ProfileShimmer();
              }else if (state is ErrorStatee){
                return Text(state.message);
              }else if (state is SuccessStatee){
                return ProfileWidget(
                  username: state.userModel.displayName??"gust",
                  onTap: () {
                    context.PushName(Routs.profileScreen);
                  },
                  image:state.userModel.photoUrl!=null
                  ? NetworkImage(state.userModel!.photoUrl!):
                  null,
                );
              }else{
                return Container();
              }
              },
            ),
            HomeScreenAddedtask(),
            SizedBox(height: 26,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BaberPlusBouttom(
                    Icon: AssetIcons.paperPlus,
                    onPressed: () {
                      context.PushName(Routs.AddTaskScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
