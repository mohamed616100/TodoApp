import '../../../Auth/signin/data/models/user_model.dart';

abstract class UserState{}
class InitialState extends UserState{}
class LodingStatee extends UserState{}
class SuccessStatee extends UserState{
   UserModel userModel;
  SuccessStatee({required this.userModel});
}
class ErrorStatee extends UserState{
  String message;
  ErrorStatee({required this.message});
}
