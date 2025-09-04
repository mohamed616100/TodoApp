import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/features/add_task/data/models/Taskmodel.dart';
import '../../../../core/widget/Bottom_widget.dart';
import '../../../../core/widget/DateField.dart';
import '../../../../core/widget/Textformfaild.dart';
import '../../../../core/widget/dropDowenGroub.dart';
import '../../../add_task/manager/cubit_Addtask.dart';
import '../../../add_task/manager/state_Addtaske.dart';
import '../widgets/stateandflag.dart';

class BodyInproggress extends StatefulWidget {
  final Taskmodel taskmodel;
  BodyInproggress({super.key, required this.taskmodel});

  @override
  State<BodyInproggress> createState() => _BodyInproggressState();
}

class _BodyInproggressState extends State<BodyInproggress> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;
  String? selectedGroup;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.taskmodel.title);
    descriptionController = TextEditingController(text: widget.taskmodel.description);
    dateController = TextEditingController(text: widget.taskmodel.date);
    selectedGroup = widget.taskmodel.group;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 22, right: 22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Stateandflag(
              TextTypeOfTask: "In Progress",
              TextTitel: "Believe you can, and you're halfway there.",
             Image: widget.taskmodel.photoUrl != null?
              NetworkImage(widget.taskmodel.photoUrl!)
                 :null),
            SizedBox(height: 40.h),
            Dropdowengroub(
              onChanged: (value) {
                setState(() {
                  selectedGroup = value;
                });
              },
              initialValue: selectedGroup,
              isEnabled: true,
            ),
            SizedBox(height: 10.h),
            Textformfaild(
              obscureText: false,
              keyboardType: TextInputType.text,
              hintText: 'Task Name',
              readOnly: false,
              maxLines: 1,
              controller: titleController,
            ),
            SizedBox(height: 10.h),
            Textformfaild(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              hintText: 'Description',
              readOnly: false,
              controller: descriptionController,
            ),
            SizedBox(height: 10.h),
            DateForm(
              enabel: false,
              DateController: dateController,
            ),
            SizedBox(height: 21.h),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return BottomWidget(
                  text: 'Mark as Done',
                  onTap: () {
                    TaskCubit.get(context).homeRepo.updateTask(
                     widget.taskmodel.id as String,
                      widget.taskmodel.copyWith(
                        status: "Done",
                      ),
                    );
                    Navigator.pop(context);

                  },
                );
              },
            ),
            SizedBox(height: 21.h),
            BottomWidget(
              text: 'Update',
              onTap: () {
                final updated = widget.taskmodel.copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: dateController.text,
                  group: selectedGroup,
                );
                TaskCubit.get(context).homeRepo.updateTask(
                  widget.taskmodel.id as String,
                  updated
                );
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}
