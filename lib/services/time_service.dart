import 'package:dio/dio.dart';
import 'package:weather_app/models/model.dart';

class TimeService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://timeapi.io/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<String>> fetchTimezones() async {
    try {
      final result = await _dio.get('/timezone/availabletimezones');
      return List<String>.from(result.data);
    } on DioException catch (e) {
      throw Exception('Failed to load timezones: ${e.message}');
    }
  }

  Future<WorldTimeModel> fetchTimeDetail(String timezone) async {
    try {
      final result = await _dio.get(
        '/timezone/zone',
        queryParameters: {'timeZone': timezone},
      );
      return WorldTimeModel.fromJson(result.data);
    } on DioException catch (e) {
      throw Exception('Failed to load time detail: ${e.message}');
    }
  }
}
