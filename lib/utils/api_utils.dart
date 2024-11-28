import 'package:dio/dio.dart';

abstract class ApiUtils {
  static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  static const baseUrl = 'http://10.0.2.2:3000/';
}
