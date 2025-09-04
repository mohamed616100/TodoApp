import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todooappnit/features/home/data/repo/home_repo.dart';
import 'package:todooappnit/features/home/manager/user_cubit/user_state.dart';

import '../../../add_task/data/repoimplement/repo.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit():super(InitialState());
  static UserCubit get(context)=>BlocProvider.of(context);
  getuserdata()async{
    HomeRepoo homeRepo=HomeRepoo();
    emit(LodingStatee());
    var Result= await homeRepo.getusermodel();
    Result.fold(ifLeft: (erorr)=>emit(ErrorStatee(message: erorr)),
        ifRight: (user)=>emit(SuccessStatee(userModel: user)));
  }

}