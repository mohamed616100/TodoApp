import 'package:image_picker/image_picker.dart';
abstract class ImageStates{}
class IintialState extends ImageStates{}
class PickImageState extends ImageStates{
  final XFile image;
  PickImageState(this.image);
}
