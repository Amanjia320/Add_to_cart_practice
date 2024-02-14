import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

class HomeLogic {
  late List<ToDo> todoslist;
  // ignore: unused_field
  late List<ToDo> _foundToDo = [];

  List<ToDo> get foundToDo => _foundToDo;

  Future<void> loadToDoList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('todos');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      todoslist = ToDo.listFromJson(jsonList);
      _foundToDo = todoslist;
    } else {
      todoslist = ToDo.todoList();
      _foundToDo = todoslist;
    }
  }

  void handleTodoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  void deleteToDoItem(String id) {
    todoslist.removeWhere((item) => item.id == id);
    _foundToDo = todoslist;
  }

  void addToDoItem(String toDo, TextEditingController todoController) {
    final itemId = DateTime.now().microsecondsSinceEpoch.toString();
    final newToDo = ToDo(id: itemId, TodoText: toDo);
    todoslist.add(newToDo);
    _foundToDo = todoslist;
    todoController.clear();
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      _foundToDo = todoslist;
    } else {
      _foundToDo = todoslist
          .where((item) => item.TodoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }

  Future<void> saveToDoList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = ToDo.listToJson(todoslist);
    await prefs.setString('todos', jsonString);
  }
}
