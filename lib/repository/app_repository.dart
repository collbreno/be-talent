import 'package:betalent/models/employee.dart';
import 'package:betalent/repository/i_app_repository.dart';
import 'package:dio/dio.dart';

class AppRepository extends IAppRepository {
  final Dio dio;

  AppRepository(this.dio);

  @override
  Future<List<Employee>> getEmployees() async {
    final result = await dio.get<List<dynamic>>('employees');
    final data = result.data!;

    return data.map((e) => Employee.fromJson(e)).toList();
  }
}
