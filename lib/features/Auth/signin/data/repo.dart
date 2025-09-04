import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/faluier.dart';
import '../../../../core/upload_image_cloudinary/uploadImageToCloudinary.dart';
import 'models/user_model.dart';

class AuthRepoImp{

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();


      if (!docSnapshot.exists) {
        return Left(Failure("User data not found in Firestore"));
      }


      final userData = docSnapshot.data()!;
      final userModel = UserModel.fromJson(userData);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(Failure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Left(Failure('Wrong password provided for that user.'));
      }
      return Left(Failure('Authentication failed. ${e.message ?? e.code}'));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }

  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String displayname,
    required File? imageFile,
  }) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? photoUrl;
      if (imageFile != null) {
        photoUrl = await uploadImageToCloudinary(imageFile);
      }

      await credential.user!.updateDisplayName(displayname);
      if (photoUrl != null) {
        await credential.user!.updatePhotoURL(photoUrl);
      }

      UserModel userModel = UserModel(
        email: email,
        displayName: displayname,
        uid: credential.user!.uid,
        photoUrl: photoUrl,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(userModel.toJson());

      return Right(userModel);
    } catch (e) {
      return Left(Failure("Register Failed: $e"));
    }
  }

}



