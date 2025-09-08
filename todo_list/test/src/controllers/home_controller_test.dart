import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/controllers/home_controller.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {
  @override
  Future<List<TodoModel>> FetchTodos() => super.noSuchMethod(
    Invocation.method(#FetchTodos, []),
    returnValue: Future.value(<TodoModel>[]),
  );
}

void main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);

  test('deve preencher variável todos', () async {
    when(repository.FetchTodos()).thenAnswer((_) async => [TodoModel()]);

    expect(controller.state, HomeState.start);

    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });


  test('deve modificaro estado para error se a requisição falhar', () async {
    when(repository.FetchTodos()).thenThrow(Exception());

    expect(controller.state, HomeState.start);

    await controller.start();
    expect(controller.state, HomeState.error);
  });
  
}
