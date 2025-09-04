import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todooappnit/features/Auth/signin/data/models/user_model.dart';

import '../../manager/cubit_login/cubit_login.dart';
import '../widget/signin_body_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key, this.photoUrl,});
  @override
  final String? photoUrl;
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Logincubit(),
      child: Scaffold(
        body: SigninBodyScreen(photoUrl: photoUrl),
      ),
    );
  }
}
