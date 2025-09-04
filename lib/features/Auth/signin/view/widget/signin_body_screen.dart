
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/core/utils/validator.dart';
import 'package:todooappnit/core/widget/Textformfaild.dart';
import 'package:todooappnit/core/widget/text_navegait.dart';
import 'package:todooappnit/features/Auth/signin/manager/cubit_login/cubit_login.dart';
import '../../../../../core/routs/Routs.dart';
import '../../../../../core/widget/Bottom_widget.dart';
import '../../../../../rescorce/asset_icons.dart';
import '../../../../../translation/transliton_kay.dart';
import '../../../../../core/widget/image_widget.dart';
import '../../manager/cubit_login/stat_cubit.dart';
class SigninBodyScreen extends StatelessWidget {
   SigninBodyScreen({super.key, this.photoUrl,});
   final String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: Logincubit.get(context).formKey,
        child: BlocConsumer<Logincubit, Loginstate>(
          listener: (context, state) {
            if (state is SuccessStateLogin) {
              context.pushAndRemoveUntil(Routs.HomeScreen,);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                ImageWidget(
                  image: photoUrl != null
                      ? NetworkImage(photoUrl!)
                      : null,
                ),
                SizedBox(height: 23.h),
                Textformfaild(
                  readOnly: false,
                  maxLines: 1,
                  validator: (value) => Validator.valditoremail(value),
                  hintText: 'Enter Your Email',
                  controller: Logincubit.get(context).EmailController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(AssetIcons.profileIcon)),
                ),

                Textformfaild(
                  readOnly: false,
                  maxLines: 1,
                  validator: (value) => Validator.valditorpassword(value),
                  hintText: TranslationKeys.Password,
                  controller: Logincubit.get(context).passwordController,
                  obscureText: Logincubit.get(context).passwordSecure,
                  keyboardType: TextInputType.text,
                  prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(AssetIcons.keyIcon)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Logincubit.get(context).changepass();
                    },
                    icon: SvgPicture.asset(Logincubit.get(context).passwordSecure
                        ? AssetIcons.unlockIcon
                        : AssetIcons.lockIcon),
                  ),
                ),

                SizedBox(height: 23.h),

                state is LoadingStateLogin
                    ? const CircularProgressIndicator()
                    : BottomWidget(
                  text: TranslationKeys.Login,
                  onTap: () {
                    if (Logincubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      Logincubit.get(context).onLogin();
                    }
                  },
                ),

                SizedBox(height: 40.h),

                TextNavegait(
                  text1: TranslationKeys.DontHaveAnAccount,
                  textbottom: TranslationKeys.Register,
                  onTap: () {
                    context.PushName(Routs.RegisterScreen);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
