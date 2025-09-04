import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todooappnit/features/profile/manger/state.dart';
class LogOutCubit extends Cubit<LogOutState>{
  LogOutCubit():super(InitialState());
  static LogOutCubit get(context)=>BlocProvider.of(context);
  Future<void> Logout() async {
    emit(LodingState());
    try {
      await FirebaseAuth.instance.signOut();
      emit(SuccessState(message: "Logout Successfully"));
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      emit(ErrorState(message: e.toString()));
    }
  }
}