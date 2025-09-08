import 'dart:convert';
// ignore: unused_import
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final Dio dio = DioMock();
  final repository = TodoRepository(dio);

  test('deve trazer uma lista de TodoModel', () async {
    // ignore: cast_from_null_always_fails
    when(dio.get('https://jsonplaceholder.typicode.com/todos')).thenAnswer(
      (_) async => Response(
        data: jsonDecode(jsonData),
        statusCode: 200, // ✅ Obrigatório
        requestOptions: RequestOptions(
          path: '',
        ), // // Lista vazia ou seus dados de teste
      ),
    );

    try {
      final todos = await repository.FetchTodos();
      expect(todos, isA<List<TodoModel>>());
      expect(todos.length, greaterThan(0));
      print('✅ Sucesso: ${todos.length} todos recebidos');
      print('Primeiro todo: ${todos.first.title}');
    } catch (e) {
      print('❌ Erro capturado: $e');
      fail('Falha ao buscar todos: $e');
    }
  });
}

String jsonData = ''' 
[
{
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  },
  {
    "userId": 1,
    "id": 4,
    "title": "et porro tempora",
    "completed": true
  },
  {
    "userId": 1,
    "id": 5,
    "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
    "completed": false
  },
  {
    "userId": 1,
    "id": 6,
    "title": "qui ullam ratione quibusdam voluptatem quia omnis",
    "completed": false
  },
  {
    "userId": 1,
    "id": 7,
    "title": "illo expedita consequatur quia in",
    "completed": false
  },
]
''';
