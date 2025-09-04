import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/DateField.dart';
import '../../../../core/widget/Textformfaild.dart';
import '../../../../core/widget/dropDowenGroub.dart';
import '../../../add_task/data/models/Taskmodel.dart';
import '../widgets/stateandflag.dart';

class BodyDone extends StatefulWidget {
  final Taskmodel taskmodel;
  const BodyDone({
    required this.taskmodel,
    super.key,

  });

  @override
  State<BodyDone> createState() => _BodyDoneState();
}

class _BodyDoneState extends State<BodyDone> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 22, right: 22),
      child: SingleChildScrollView(
        child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      Stateandflag(
                        TextTypeOfTask: "Done",
                        TextTitel: "Congrats!",
                        Image:
                            widget.taskmodel.photoUrl != null?
                        NetworkImage(widget.taskmodel.photoUrl!):
                        null,
                      ),
                      SizedBox(height: 40.h),
                      Dropdowengroub(onChanged: (val) {

                      },initialValue: widget.taskmodel.group,
                        isEnabled: false,),
                      Textformfaild(
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        hintText: 'Task Name',
                        readOnly: true,
                        enabel: false,
                        maxLines: 1,
                        controller: TextEditingController(text: widget.taskmodel.title),

                      ),
                      Textformfaild(
                        enabel: false,
                        obscureText: false,
                        keyboardType: TextInputType.multiline,
                        hintText: 'Description',
                        readOnly: true,
                        controller: TextEditingController(text: widget.taskmodel.description),

                      ),
                      DateForm(
                        enabel: true,
                        DateController: TextEditingController(text: widget.taskmodel.date),

                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}