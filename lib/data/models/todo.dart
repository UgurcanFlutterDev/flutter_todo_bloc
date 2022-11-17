class Todo {
  String? todoMessage;
  bool? isCompleted;
  int? id;

  Todo({this.todoMessage, this.isCompleted, this.id});

  Todo.fromJson(Map<String, dynamic> json) {
    todoMessage = json['todoMessage'];
    isCompleted = json['isCompleted'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todoMessage'] = this.todoMessage;
    data['isCompleted'] = this.isCompleted;
    data['id'] = this.id;
    return data;
  }
}
