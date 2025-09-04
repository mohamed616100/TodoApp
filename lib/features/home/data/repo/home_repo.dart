import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Auth/signin/data/models/user_model.dart';

class HomeRepoo{
  Future<Either<String, UserModel>> getusermodel()async{
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      UserModel User=UserModel.fromJson(docSnapshot.data()!);
      return Right(User);
    } on Exception catch (e) {
      // TODO
      return Left(e.toString());
    }

  }
}