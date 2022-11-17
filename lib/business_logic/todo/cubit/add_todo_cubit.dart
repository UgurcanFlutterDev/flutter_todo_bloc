import 'package:bloc/bloc.dart';
import 'package:bloc_blog/business_logic/todo/cubit/todos_cubit.dart';
import 'package:bloc_blog/data/models/todo.dart';
import 'package:bloc_blog/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit({required this.todosCubit, required this.repository}) : super(AddTodoInitial());
  final Repository repository;
  final TodosCubit todosCubit;

  Future<void> addTodo(Todo todo) async {
    emit(AddTodoLoading());
    if (todo.todoMessage == null || todo.todoMessage!.isEmpty) {
      emit(AddTodoError(error: "Todo message can't be empty."));
    } else {
      final resp = await repository.addTodo(todo);
      if (resp) {
        todosCubit.addTodo(todo);
        emit(AddTodoFinished());
      } else {
        emit(AddTodoError(error: "Yüklenirken bir sorun oluştu."));
      }
    }
  }
}
