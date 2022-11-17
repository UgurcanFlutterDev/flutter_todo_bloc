import 'package:bloc_blog/business_logic/todo/cubit/add_todo_cubit.dart';
import 'package:bloc_blog/data/models/todo.dart';
import 'package:bloc_blog/data/repository/repository.dart';
import 'package:bloc_blog/data/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/todo/cubit/todos_cubit.dart';

class EditTodoScreen extends StatelessWidget {
  EditTodoScreen({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo Screen'),
      ),
      body: BlocListener<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is AddTodoFinished) {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AddTodoCubit>(context).addTodo(
                  Todo(
                    id: 3,
                    isCompleted: true,
                    todoMessage: textEditingController.text,
                  ),
                );
              },
              child: BlocBuilder<AddTodoCubit, AddTodoState>(
                builder: (context, state) {
                  if (state is AddTodoError) {
                    return Text(state.error);
                  }
                  if (state is AddTodoLoading) {
                    return CircularProgressIndicator();
                  }
                  return Text("Add Todo");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
