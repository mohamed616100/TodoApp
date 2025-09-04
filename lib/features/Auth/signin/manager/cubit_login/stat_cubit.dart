import '../../data/models/user_model.dart';

abstract class Loginstate{}
class initialstate extends Loginstate{}
class changepassstate extends Loginstate{}
class LoadingStateLogin extends Loginstate{}
class SuccessStateLogin extends Loginstate{
  final UserModel user;

  SuccessStateLogin({required this.user});
}
class ErrorStateLogin extends Loginstate{
  final String error;
  ErrorStateLogin({required this.error});
}
