import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todooappnit/features/add_task/manager/state_Addtaske.dart';
import '../data/models/Taskmodel.dart';
import '../data/repoimplement/repo.dart';

class TaskCubit extends Cubit<TaskState> {
  final HomeRepo homeRepo;
  File? image;

  static TaskCubit get(BuildContext context) => BlocProvider.of(context);

  TaskCubit(this.homeRepo) : super(TaskInitial());

  void loadTasks() {
    emit(TaskLoading());
    try {
      homeRepo.getTasks().listen((tasks) {
        emit(TaskLoaded(tasks));
      });
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> addTask(Taskmodel task, String date) async {
    emit(TaskLoading());
    try {
      await homeRepo.addTask(task);
      emit(TaskLoaded([task]));
    } catch (e) {
      emit(TaskError("Failed to add task: $e"));
    }
  }


  Future<void> updateTask(String id, Taskmodel task) async {
    try {
      await homeRepo.updateTask(id, task);
    } catch (e) {
      emit(TaskError("Failed to update task: $e"));
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await homeRepo.deleteTask(id);
    } catch (e) {
      emit(TaskError("Failed to delete task: $e"));
    }
  }

  void search(String query) {
    emit(TaskLoading());
    try {
      homeRepo.searchTasks(query).listen((tasks) {
        emit(TaskLoaded(tasks));
      });
    } catch (e) {
      emit(TaskError("Failed to search: $e"));
    }
  }


}
