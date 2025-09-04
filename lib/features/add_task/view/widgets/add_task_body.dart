import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todooappnit/core/widget/image_picker/Image_picker_view.dart';
import 'package:todooappnit/features/add_task/manager/cubit_Addtask.dart';

import '../../../../core/upload_image_cloudinary/uploadImageToCloudinary.dart';
import '../../../../core/widget/Bottom_widget.dart';
import '../../../../core/widget/Textformfaild.dart';
import '../../../../core/widget/dropDowenGroub.dart';
import '../../../../core/widget/image_widget.dart';
import '../../../../translation/transliton_kay.dart';
import '../../data/models/Taskmodel.dart';
import 'clender_form.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final _formKey = GlobalKey<FormState>();

  final TitleController = TextEditingController();
  final DescriptionController = TextEditingController();

  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),
              ImagePickerView(
                defaultBuilder: ImageWidget(),
                imageBuilder: (image) {
                  return ImageWidget(image: FileImage(File(image.path)));
                }, onImagePicked: (XFile image) {
                  setState(() {
                    TaskCubit.get(context).image = File(image.path);
                  });
              },
              ),
              SizedBox(height: 19.h),
              Textformfaild(
                readOnly: false,
                obscureText: false,
                keyboardType: TextInputType.text,
                hintText: TranslationKeys.Title,
                controller: TitleController,
                maxLines: 1,
              ),
              Textformfaild(
                readOnly: false,
                obscureText: false,
                keyboardType: TextInputType.multiline,
                hintText: TranslationKeys.Description,
                controller: DescriptionController,
              ),
              Dropdowengroub(
                onChanged: (val) {
                  setState(() {
                    selectedGroup = val;
                  });
                },
              ),
              const ClenderForm(
              ),
              BottomWidget(
                text: TranslationKeys.AddTask,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                    try {
                      String? photoUrl;

                      if (TaskCubit.get(context).image != null) {
                        photoUrl = await uploadImageToCloudinary(TaskCubit.get(context).image!);
                      }

                      final task = Taskmodel(
                        title: TitleController.text,
                        description: DescriptionController.text,
                        group: selectedGroup ?? '',
                        date: ClenderForm.DateController.text,
                        photoUrl: photoUrl,
                      );

                      await TaskCubit.get(context).homeRepo.addTask(task);
                      TaskCubit.get(context).image = null;
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } catch (e) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to add task: $e")),
                      );
                    }
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
