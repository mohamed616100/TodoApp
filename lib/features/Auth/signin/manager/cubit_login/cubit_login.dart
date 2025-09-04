import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todooappnit/features/Auth/signin/data/repo.dart';
import 'package:todooappnit/features/Auth/signin/manager/cubit_login/stat_cubit.dart';

class Logincubit extends Cubit<Loginstate> {
  Logincubit() : super(initialstate());
  bool passwordSecure = true;
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static Logincubit get(context) => BlocProvider.of(context);

  void changepass() {
    passwordSecure = !passwordSecure;
     {
      emit(changepassstate());
    }
  }
  Future<void> onLogin() async {
    AuthRepoImp authRepoImp = AuthRepoImp();

     emit(LoadingStateLogin());
    final result = await authRepoImp.login(
      email: EmailController.text,
      password: passwordController.text,
    );

    result.fold(
      ifLeft: (error) {
        emit(ErrorStateLogin(error: error.message));
      },
      ifRight: (userdata) {
        emit(SuccessStateLogin(user: userdata));
      },
    );
  }
}
