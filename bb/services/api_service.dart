import 'package:dio/dio.dart';
import "package:bb/models/task_model.dart";

 // Заменить 'bb' на имя твоего проекта

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://yourapi.com';

  Future<List> fetchTasks() async {
    try {
      final response = await _dio.get('$_baseUrl/tasks');
      List tasks = (response.data as List)
          .map((taskData) => TaskModel.fromJson(taskData))
          .toList();
      return tasks;
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  Future<void> createTask(TaskModel task) async {
    try {
      await _dio.post('$_baseUrl/tasks', data: task.toJson());
    } catch (e) {
      throw Exception('Failed to create task: $e');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      await _dio.put('$_baseUrl/tasks/${task.id}', data: task.toJson());
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _dio.delete('$_baseUrl/tasks/$taskId');
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }
}

class TaskModel {
  get id => null;

  static fromJson(taskData) {}
  
  toJson() {}
}
