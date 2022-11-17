import 'package:bloc/bloc.dart';
import 'package:bloc_blog/data/repository/repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/todo.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit({required this.repository}) : super(TodosInitial());

  final Repository repository;

  Future<void> fetchTodos() async {
    emit(TodosLoading());
    final response = await repository.fetchTodos();
    emit(TodosLoaded(todos: response));
  }

  void addTodo(Todo todo) {
    final currentState = state;
    if (currentState is TodosLoaded) {
      final todoList = currentState.todos;
      todoList.add(todo);
      emit(TodosLoaded(todos: todoList));
    }
  }
}
