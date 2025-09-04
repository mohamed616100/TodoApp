abstract class LogOutState{}
class InitialState extends LogOutState{}
class LodingState extends LogOutState{}
class SuccessState extends LogOutState{
  final String message;
  SuccessState({required this.message});
}
class ErrorState extends LogOutState{
  final String message;
  ErrorState({required this.message});
}

