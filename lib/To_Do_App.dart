import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/core/routs/Routs.dart';
import 'package:todooappnit/features/add_task/manager/cubit_Addtask.dart';
import 'core/routs/App_routs.dart';
import 'core/thiming/color.dart';
import 'features/add_task/data/repoimplement/repo.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) =>
          BlocProvider(
            create: (context) => TaskCubit(HomeRepo()),
            child: MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Appcolors.background,
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouts.onMakeRoute,
              initialRoute: Routs.SplashScreen,
            ),
          ),
    );
  }
}