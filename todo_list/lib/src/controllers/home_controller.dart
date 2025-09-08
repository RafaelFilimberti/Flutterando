import 'package:flutter/material.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

enum HomeState { start, loading, success, error }

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final ValueNotifier<HomeState> state = ValueNotifier<HomeState>(
    HomeState.start,
  );

  HomeController([TodoRepository? repository])
    : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.FetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}
