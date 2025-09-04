import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'cubit/Cubit.dart';
import 'cubit/States.dart';
class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key, required this.defaultBuilder,
    required this.imageBuilder,
    required this.onImagePicked
  });
  final Widget defaultBuilder;
  final Widget Function(XFile image) imageBuilder;
  final void Function(XFile image) onImagePicked;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: ImageCubit.get(context).PickImge,
            child: BlocConsumer<ImageCubit, ImageStates>(
                listener:(context,state){
                  if(state is PickImageState){
                    onImagePicked(state.image);
                  }
                },
                builder: (context,state){
                 if(state is PickImageState){
                   return imageBuilder(state.image);
                 }else{
                   return defaultBuilder;
                 }
                }
            ),
          );
        }
      )
    );
  }
}
