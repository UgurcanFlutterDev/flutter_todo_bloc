import 'dart:developer';

import 'package:bloc_blog/business_logic/todo/cubit/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return CircularProgressIndicator();
          } else if (state is TodosLoaded) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/edit-todo");
                  },
                  child: Text("Add New Todo"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.todos.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(state.todos[index].todoMessage!),
                    );
                  }),
                ),
              ],
            );
            // Column(
            //   children: [
            //     Text("Loaded ${state.todos.length}"),

            //   ],
            // );
          }
          return SizedBox();
        },
      ),
    );
  }
}
