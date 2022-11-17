import 'package:bloc_blog/business_logic/todo/cubit/add_todo_cubit.dart';
import 'package:bloc_blog/business_logic/todo/cubit/todos_cubit.dart';
import 'package:bloc_blog/data/repository/repository.dart';
import 'package:bloc_blog/data/services/network_service.dart';
import 'package:bloc_blog/presentation/screens/todo/add_todo.dart';
import 'package:bloc_blog/presentation/screens/todo/edit_todo_screen.dart';
import 'package:bloc_blog/presentation/screens/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late Repository repository;
  late TodosCubit todosCubit;
  late AddTodoCubit addTodoCubit;
  AppRouter() {
    repository = Repository(networkService: NetworkService());
    todosCubit = TodosCubit(repository: repository);
    addTodoCubit = AddTodoCubit(todosCubit: todosCubit, repository: repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit,
            child: TodoScreen(),
          ),
        );
      case "/edit-todo":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: addTodoCubit,
            child: EditTodoScreen(),
          ),
        );
      case "/add-todo":
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      default:
        return null;
    }
  }
}
