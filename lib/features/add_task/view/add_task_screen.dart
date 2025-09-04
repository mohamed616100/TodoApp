import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/core/routs/Routs.dart';
import 'package:todooappnit/core/thiming/styles.dart';
import 'package:todooappnit/features/add_task/manager/cubit_Addtask.dart';
import '../../../rescorce/asset_icons.dart';
import '../../../translation/transliton_kay.dart';
import '../data/repoimplement/repo.dart';
import 'widgets/add_task_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            context.popName(Routs.HomeScreen);
          }, icon: SvgPicture.asset(AssetIcons.arrowback)),
          centerTitle: true,
          title: Text(TranslationKeys.AddTask, style: AppStyel.Scfoold,),
        ),
        body: AddTaskBody(),
    );
  }
}
