import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todooappnit/features/home/manager/user_cubit/cubit.dart';
import '../../../Auth/signin/data/models/user_model.dart';
import '../widget/home_screen_body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getuserdata(),
      child: Scaffold(
        body: HomeScreenBody(),
      ),
    );
  }
}
