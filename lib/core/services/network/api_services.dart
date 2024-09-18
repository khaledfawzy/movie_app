import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
  
class ApiServices {
  final Dio _dio;

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? parameters,
    bool isListString=false,
  }) async {
    Response response = await _dio.get(
      '$baseUrl$endPoint',
      queryParameters: parameters,
      options:  Options(headers: {
              'Authorization': 'Bearer $apiKey',
            }),
    );
    if (isListString) {
      List<String> stringList = response.data.map((e) => e.toString()).toList();
      return stringList;
    } else {
      return response.data['results'];
    }
  }
  Future<dynamic> get2({
    required String endPoint,
    Map<String, dynamic>? parameters,
    bool isListString=false,
  }) async {
    Response response = await _dio.get(
      '$baseUrl$endPoint',
      queryParameters: parameters,
      options:  Options(headers: {
              'Authorization': 'Bearer $apiKey',
            }),
    );
    if (isListString) {
      List<String> stringList = response.data.map((e) => e.toString()).toList();
      return stringList;
    } else {
      return response.data;
    }
  }

  ApiServices(this._dio);
}
