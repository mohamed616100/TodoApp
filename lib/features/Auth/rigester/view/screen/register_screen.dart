import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit_rgister/cubit_register.dart';
import '../widget/register_body_screen.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitRgister(),
      child: Scaffold(
        body: RegisterBodyScreen(),
      ),
    );
  }
}
