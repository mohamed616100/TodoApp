import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todooappnit/core/widget/image_picker/cubit/States.dart';

class ImageCubit extends Cubit<ImageStates>{
  ImageCubit():super(IintialState());
  static ImageCubit get(context)=>BlocProvider.of(context);
  PickImge()async{
    final ImagePicker imagePicker=ImagePicker();
    final XFile? image=await imagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      emit(PickImageState(image));
    }
  }

}