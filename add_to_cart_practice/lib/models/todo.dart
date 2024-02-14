// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ToDo {
  String? id;
  String? TodoText;
  bool isDone;

  ToDo({required this.id, required this.TodoText, this.isDone = false});

  static List<ToDo> listFromJson(List<dynamic> json) {
    return json.map((item) {
      return ToDo(
        id: item['id'],
        TodoText: item['TodoText'],
        isDone: item['isDone'] ?? false,
      );
    }).toList();
  }

  static String listToJson(List<ToDo> todos) {
    List<Map<String, dynamic>> toJsonList =
        todos.map((todo) => todo.toJson()).toList();
    return jsonEncode(toJsonList);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'TodoText': TodoText,
      'isDone': isDone,
    };
  }

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '01',
        TodoText: 'Morning Excercise',
      ),
      ToDo(
        id: '02',
        TodoText: 'Buy Groceries',
      ),
      ToDo(id: '03', TodoText: 'Check Emails'),
      ToDo(id: '04', TodoText: 'Team Meeting'),
      ToDo(id: '05', TodoText: 'Work on mobile apps 2 hours'),
      ToDo(id: '06', TodoText: 'Dinner with jenny'),
    ];
  }
}




















// class ToDo {
//   String? id;
//   String? TodoText;
//   bool isDone;

//   ToDo({required this.id, required this.TodoText, this.isDone = false});

//   static List<ToDo> todoList()
//   /*
//   When you declare a member (variable, method, etc.) as static,
//   it means that you can access that member directly from the class itself,
//   without needing to create an instance of the class.
//   */
//   {
//     return [
//       ToDo(
//         id: '01',
//         TodoText: 'Morning Excercise',
//       ),
//       ToDo(
//         id: '02',
//         TodoText: 'Buy Groceries',
//       ),
//       ToDo(id: '03', TodoText: 'Check Emails'),
//       ToDo(id: '04', TodoText: 'Team Meeting'),
//       ToDo(id: '05', TodoText: 'Work on mobile apps 2 hours'),
//       ToDo(id: '06', TodoText: 'Dinner with jenny'),
//     ];
//   }
// }
