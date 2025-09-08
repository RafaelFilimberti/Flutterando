import 'package:dio/dio.dart';
import 'package:todo_list/src/models/todo_model.dart';

class TodoRepository {
  final Dio dio; // Cliente HTTP para fazer requisições
  final url = 'https://jsonplaceholder.typicode.com/todos';

  /*  TodoRepository([Dio client]) {
    if (client == null){
      this.dio = Dio();
    } else {
      this.dio = dio;
    }
  } */

  TodoRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<TodoModel>> FetchTodos() async {
    final response = await dio.get(url); // Faz GET na API
    final list = response.data as List; // Converte resposta em List

    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
