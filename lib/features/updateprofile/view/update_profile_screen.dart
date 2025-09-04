import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/core/widget/image_widget.dart';

import '../../../core/widget/Textformfaild.dart';
import '../../../rescorce/assets_image.dart';
import '../../home/manager/user_cubit/cubit.dart';
import '../../home/manager/user_cubit/user_state.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getuserdata(),
      child: Scaffold(
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is LodingStatee) {
              return CircularProgressIndicator();
            } else if (state is ErrorStatee) {
              return Text(state.message);
            } else if (state is SuccessStatee) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ImageWidget(
                      image: state.userModel.photoUrl != null ?
                      NetworkImage(state.userModel.photoUrl!) :
                      null,
                    ),
                    SizedBox(height: 23.h,),
                    Textformfaild(
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      hintText: "Username",
                      maxLines: 1,
                      readOnly: true,
                      controller: state.userModel.displayName != null ?
                      TextEditingController(text: state.userModel.displayName) :
                      null,
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
