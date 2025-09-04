import 'package:flutter/material.dart';
import 'package:todooappnit/features/Auth/signin/data/models/user_model.dart';
import 'package:todooappnit/features/Auth/signin/view/screen/signin_screen.dart';
import '../../features/Auth/rigester/view/screen/register_screen.dart';
import '../../features/Lets_Start/view/screen/lets_start_screen.dart';
import '../../features/Settings/view/Sittings_screen.dart';
import '../../features/add_task/data/models/Taskmodel.dart';
import '../../features/add_task/view/add_task_screen.dart';
import '../../features/change_password/view/change_pass_screen.dart';
import '../../features/editTask/view/edit_screen.dart';
import '../../features/home/view/screen/home_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/splash/view/screen/splash_screen.dart';
import '../../features/updateprofile/view/update_profile_screen.dart';
import '../../features/viewtaskes/view/view_task_screen.dart';
import 'Routs.dart';

abstract class AppRouts{
  static Route onMakeRoute(RouteSettings settings){
    switch(settings.name){
      case Routs.SplashScreen:
        return MaterialPageRoute(builder: (context)=>SplashScreen());

      case Routs.LetsStartScreen:
        return MaterialPageRoute(builder: (context)=>LetsStartScreen());

      case Routs.RegisterScreen:
        return MaterialPageRoute(builder: (context)=>RegisterScreen());

      case Routs.SigninScreen:
        final String? photoUrl = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => SigninScreen(photoUrl: photoUrl),
          settings: settings,
        );

      case Routs.HomeScreen:
        return MaterialPageRoute(builder: (context)=>HomeScreen(),
        );

      case Routs.AddTaskScreen:
        return MaterialPageRoute(builder: (context)=>AddTaskScreen());

      case Routs.profileScreen:
        return MaterialPageRoute(builder: (context)=>ProfileScreen());

      case Routs.UpdateProfileScreen:
        return MaterialPageRoute(builder: (context)=>UpdateProfileScreen());

      case Routs.changePassScreen:
        return MaterialPageRoute(builder: (context)=>ChangePassScreen());

      case Routs.SittingsScreen:
        return MaterialPageRoute(builder: (context)=>SittingsScreen());

      case Routs.ViewTaskScreen:
        return MaterialPageRoute(builder: (context)=>ViewTaskScreen());

      case Routs.EditTaskScreen:
        final task = settings.arguments as Taskmodel;
        return MaterialPageRoute(
          builder: (context) => EditScreen(Task: task),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text("Route not found"),
              ),
            )
        );
    }
  }
}