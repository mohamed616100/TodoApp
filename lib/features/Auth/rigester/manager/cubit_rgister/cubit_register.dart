import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todooappnit/features/Auth/rigester/manager/cubit_rgister/state_register.dart';
import 'package:todooappnit/features/Auth/signin/data/repo.dart';
class CubitRgister extends Cubit<StateRegister>{
  CubitRgister():super(InitialStateRegister());
  bool passwordSecure = true;
  XFile? image;
  bool confirmpasswordSecure = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
  static CubitRgister get(context)=>BlocProvider.of(context);
  void changepass() {
    passwordSecure = !passwordSecure;
    emit(ChangePassStateRegister());
  }

  void changeconfirmpass() {
    confirmpasswordSecure = !confirmpasswordSecure;
    emit(ChangePassStateRegister());
  }
  onRegister()async{
    emit(LoadingStateRegister());
    AuthRepoImp authRepoImp = AuthRepoImp();
    File? fileImage = image != null ? File(image!.path) : null;
    var result= await authRepoImp.register(
      imageFile: fileImage,
        email:emailController.text,
        displayname: usernameController.text,
        password: passwordController.text,
    );
    result.fold(ifLeft: (error)=>emit(ErrorStateRegister(error: error.message)),
        ifRight: (usermodel)=>emit(SuccessStateRegister(user: usermodel)));
  }

}