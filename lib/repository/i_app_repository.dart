import 'package:betalent/models/employee.dart';

abstract class IAppRepository {
  Future<List<Employee>> getEmployees();
}
