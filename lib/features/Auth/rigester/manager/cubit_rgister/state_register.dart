import '../../../signin/data/models/user_model.dart';

abstract class StateRegister{}
class InitialStateRegister extends StateRegister{}
class ChangePassStateRegister extends StateRegister{}
class LoadingStateRegister extends StateRegister{}
class SuccessStateRegister extends StateRegister{
  final UserModel user;
  SuccessStateRegister({ required this.user});
}
class ErrorStateRegister extends StateRegister{
  final String error;
  ErrorStateRegister({required this.error});
}