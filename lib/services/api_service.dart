import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

// Abstract class for API service
abstract class ApiService {
  Future<dynamic> get(String endpoint);
  Future<dynamic> post(String endpoint, dynamic data);
  Future<dynamic> update(String endpoint, dynamic data);
  Future<dynamic> delete(String endpoint);
}

// Implementation of API service using Dio
class DioApiService implements ApiService {
  Dio _dio = Dio(); //This is an instance of the Dio

  Future<dynamic> get(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response.data;
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  Future<dynamic> post(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response.data;
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  Future<dynamic> update(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.put(endpoint, data: data);
      return response.data;
    } catch (error) {
      throw Exception('Failed to perform UPDATE request: $error');
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return response.data;
    } catch (error) {
      throw Exception('Failed to perform DELETE request: $error');
    }
  }
}

// Implementation of API service using http package
class HttpApiService implements ApiService {
  @override
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(endpoint));
      return response.body;
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  @override
  Future<dynamic> post(String endpoint, dynamic data) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: data,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response.body;
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  @override
  Future<dynamic> update(String endpoint, dynamic data) async {
    try {
      final response = await http.put(
        Uri.parse(endpoint),
        body: data,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response.body;
    } catch (error) {
      throw Exception('Failed to perform UPDATE request: $error');
    }
  }

  @override
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await http.delete(
        Uri.parse(endpoint),
      );
      return response.body;
    } catch (error) {
      throw Exception('Failed to perform DELETE request: $error');
    }
  }
}
