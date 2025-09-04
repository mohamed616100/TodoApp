import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/core/utils/validator.dart';
import 'package:todooappnit/core/widget/Bottom_widget.dart';
import 'package:todooappnit/core/widget/Textformfaild.dart';
import 'package:todooappnit/core/widget/image_picker/Image_picker_view.dart';
import 'package:todooappnit/core/widget/text_navegait.dart';
import 'package:todooappnit/core/widget/image_widget.dart';
import '../../../../../core/routs/Routs.dart';
import '../../../../../rescorce/asset_icons.dart';
import '../../../../../translation/transliton_kay.dart';
import '../../manager/cubit_rgister/cubit_register.dart';
import '../../manager/cubit_rgister/state_register.dart';
class RegisterBodyScreen extends StatelessWidget {
   const RegisterBodyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: CubitRgister.get(context).formKey,
        child: BlocConsumer<CubitRgister, StateRegister>(
  listener: (context, state) {
    if(state is SuccessStateRegister){
      var image= state.user.photoUrl;
      context.PushName(Routs.SigninScreen,arguments: image);
    }
    if(state is ErrorStateRegister){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
    }
  },
  builder: (context, state) {
    return Column(
          children: [
            ImagePickerView(
                defaultBuilder: ImageWidget(),
                imageBuilder: (image){
                   return ImageWidget(image: FileImage(File(image.path)));
                },
                onImagePicked: (image)=>CubitRgister.get(context).image=image),
            SizedBox(height: 23.h,),
            Textformfaild(
                      readOnly: false,
                      maxLines: 1,
                        obscureText: false,
                        hintText: TranslationKeys.Username,
                        keyboardType:TextInputType.text,
                        controller:CubitRgister.get(context).usernameController,
                        prefixIcon: IconButton(onPressed: null, icon: SvgPicture.asset(AssetIcons.profileIcon)),
                    ),
            Textformfaild(
              readOnly: false,
              maxLines: 1,
              obscureText: false,
              hintText: "Email",
              keyboardType:TextInputType.emailAddress,
              validator: (value)=>Validator.valditoremail(value),
              controller:CubitRgister.get(context).emailController,
              prefixIcon: IconButton(onPressed: null, icon: SvgPicture.asset(AssetIcons.profileIcon)),
            ),

            Textformfaild(
              readOnly: false,
              validator: (value)=>Validator.valditorpassword(value),
              maxLines: 1,
                hintText: TranslationKeys.Password,
                obscureText: CubitRgister.get(context).passwordSecure,
                keyboardType:TextInputType.text,
                prefixIcon: IconButton(onPressed: null, icon: SvgPicture.asset(AssetIcons.keyIcon)),
              suffixIcon: IconButton(onPressed: (){
                CubitRgister.get(context).changepass();
              }, icon: SvgPicture.asset(
                  CubitRgister.get(context).passwordSecure ?AssetIcons.unlockIcon: AssetIcons.lockIcon)),
              controller:CubitRgister.get(context).passwordController,
            ),
          Textformfaild(
              readOnly: false,
              maxLines: 1,
              hintText: TranslationKeys.ConfirmPassword,
            obscureText: CubitRgister.get(context).confirmpasswordSecure,
              validator: (value)=>Validator.valditorconfirmpassword(
                value,
                CubitRgister.get(context).passwordController.text
              ),
              keyboardType:TextInputType.text,
                prefixIcon:  IconButton(onPressed: null, icon: SvgPicture.asset(AssetIcons.keyIcon)),
              suffixIcon: IconButton(onPressed: (){
                CubitRgister.get(context).changeconfirmpass();

              }, icon:SvgPicture.asset( CubitRgister.get(context).confirmpasswordSecure ?AssetIcons.unlockIcon: AssetIcons.lockIcon)),
              controller: CubitRgister.get(context).confirmPasswordController,
            ),
            SizedBox(height: 23.h),
            state is LoadingStateRegister?
            CircularProgressIndicator():
            BottomWidget(text: TranslationKeys.Register, onTap: () {
              if(CubitRgister.get(context).formKey.currentState!.validate()){
                CubitRgister.get(context).onRegister();
              }
            }
            ),
            SizedBox(height: 20.h,),
            TextNavegait(
              text1: TranslationKeys.AlreadyHaveAnAccount,
              textbottom: TranslationKeys.Login,
               onTap: (){
                context.PushName(Routs.SigninScreen);
               },),
          ],
        );
  },
),
      ),
    );
  }
}
