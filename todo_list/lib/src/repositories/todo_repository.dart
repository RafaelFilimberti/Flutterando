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
    try {
      final response = await dio.get(url); // Faz GET na API
      final list = response.data as List; // Converte resposta em List

      return list.map((json) => TodoModel.fromJson(json)).toList();
    } on DioException catch (e) {
      // Tratamento específico de erros Dio
      throw _handleDioError(e);
    } catch (e) {
      // Outros erros
      throw Exception('Erro inesperado: $e');
    }
  }

  // Converte cada item JSON em TodoModel
  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Timeout de conexão';
      case DioExceptionType.receiveTimeout:
        return 'Timeout ao receber dados';
      case DioExceptionType.badResponse:
        return 'Erro ${e.response?.statusCode}: ${e.response?.statusMessage}';
      case DioExceptionType.cancel:
        return 'Requisição cancelada';
      case DioExceptionType.connectionError:
        return 'Erro de conexão';
      default:
        return 'Erro de rede desconhecido';
    }
  }
}
