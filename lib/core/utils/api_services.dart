import 'package:api_testing/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.post(
      baseUrl,
      data: data,
    );
    return response.data;
  }

  Future<dynamic> put({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.put(
      '$baseUrl/$id',
      data: data,
    );
    return response.data;
  }

  Future<dynamic> delete({
    required int id,
  }) async {
    var response = await dio.delete(
      '$baseUrl/$id',
    );
    return response.data;
  }
}
