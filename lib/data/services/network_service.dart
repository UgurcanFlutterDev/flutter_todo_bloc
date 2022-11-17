import 'dart:convert';

import 'package:bloc_blog/data/models/todo.dart';
import 'package:dio/dio.dart';

class NetworkService {
  final baseUrl = "https://crudcrud.com/api/c0180743f0db487985d1f990b5330bd1/todos";

  final Dio dio = Dio();

  Future<Response?> fetchTodos() async {
    try {
      final Response response = await dio.get(baseUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> addTodo(Todo todo) async {
    try {
      final Response response = await dio.post(baseUrl, data: todo);
      return response;
    } catch (e) {
      return null;
    }
  }
}
