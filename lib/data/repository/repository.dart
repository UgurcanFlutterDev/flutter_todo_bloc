import 'dart:developer';

import 'package:bloc_blog/data/models/todo.dart';
import 'package:bloc_blog/data/services/network_service.dart';
import 'package:dio/dio.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<Todo>> fetchTodos() async {
    final Response? response = await networkService.fetchTodos();
    if (response != null) {
      var todoList = response.data.map<Todo>((e) => Todo.fromJson(e)).toList();
      return todoList;
    }
    return [];
  }

  Future<bool> addTodo(Todo todo) async {
    final Response? response = await networkService.addTodo(todo);
    if (response != null) {
      return true;
    }
    return false;
  }
}
