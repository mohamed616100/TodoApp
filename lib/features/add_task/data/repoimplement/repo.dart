import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/Taskmodel.dart';
class HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference get _userTaskCollection {
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      throw Exception("User not logged in");
    }
    return _firestore.collection("users").doc(uid).collection("tasks");
  }

  Future<void> addTask(Taskmodel task) async {
    try {
      await _userTaskCollection.add(task.toJson());
    } catch (e) {
      throw Exception("Failed to add task: $e");
    }
  }
  Stream<List<Taskmodel>> getTasks() {
    try {
      return _userTaskCollection.snapshots().map((snapshot) =>
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Taskmodel.fromJson(data)..id = doc.id;
          }).toList());
    } catch (e) {
      throw Exception("Failed to get tasks: $e");
    }
  }

  Future<void> updateTask(String docId, Taskmodel updatedTask) async {
    try {
      await _userTaskCollection.doc(docId).update(updatedTask.toJson());
    } catch (e) {
      throw Exception("Failed to update task: $e");
    }
  }

  Future<void> deleteTask(String docId) async {
    try {
      await _userTaskCollection.doc(docId).delete();
    } catch (e) {
      throw Exception("Failed to delete task: $e");
    }
  }

  Stream<List<Taskmodel>> searchTasks(String query) {
    try {
      return _userTaskCollection
          .where("Title", isGreaterThanOrEqualTo: query)
          .where("Title", isLessThanOrEqualTo: "$query\uf8ff")
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Taskmodel.fromJson(data)..id = doc.id;
      }).toList());
    } catch (e) {
      throw Exception("Failed to search tasks: $e");
    }
  }
}
