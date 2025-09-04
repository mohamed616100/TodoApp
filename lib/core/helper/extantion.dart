import 'package:flutter/cupertino.dart';
extension Navegathelper on BuildContext{
  PushName(String name,{Object? arguments}){
    return Navigator.pushNamed(this, name,arguments: arguments);
  }
}

extension PushReplacement on BuildContext{
   PushReplacementName(String name,{Object? arguments}){
    return Navigator.pushReplacementNamed(this, name,arguments: arguments);
  }
}

extension PopName on BuildContext {
  void popName(String name) {
    Navigator.pop(this, name);
  }
}

extension PushAndRemoveUntil on BuildContext {
  void pushAndRemoveUntil(String name,{Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, name, (route) => false,arguments: arguments);
  }
}
