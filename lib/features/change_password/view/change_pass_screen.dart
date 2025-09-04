import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/core/widget/image_widget.dart';
import '../../../core/widget/Bottom_widget.dart';
import '../../../core/widget/Textformfaild.dart';
import '../../../rescorce/assets_image.dart';
import '../../home/manager/user_cubit/cubit.dart';
import '../../home/manager/user_cubit/user_state.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                return
                  SingleChildScrollView(
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
                          keyboardType: TextInputType.text,
                          hintText: "Old Password",
                          maxLines: 1,
                          readOnly: false,
                          controller: oldPasswordController,
                        ),

                        Textformfaild(
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          hintText: "New Password",
                          maxLines: 1,
                          readOnly: false,
                          controller: newPasswordController,
                        ),

                        Textformfaild(
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          hintText: "Confirm Password",
                          maxLines: 1,
                          readOnly: false,
                          controller: confirmPasswordController,
                        ),
                        SizedBox(height: 23.h,),

                        BottomWidget(
                          text: "Update",
                          onTap: () {
                            print("Update");
                          },
                        )

                      ],
                    ),
                  );
              } else {
                return Container();
              }
            }
        ),
      ),
    );
  }
}
