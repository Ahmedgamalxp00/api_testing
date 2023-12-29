import 'package:api_testing/core/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<dynamic> get() async {
    var response = await dio.get(
      baseUrl,
    );
    return response.data;
  }

  Future<dynamic> post({
    // required int id,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.get(
      baseUrl,
      data: data,
    );
    return response.data;
  }
}
