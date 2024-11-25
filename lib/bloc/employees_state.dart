part of 'employees_cubit.dart';

class EmployeesState extends Equatable {
  final String query;
  final AsyncData<List<Employee>> result;

  List<Employee>? get filtered => query.isEmpty
      ? result.data
      : result.data?.where((e) => e.containsQuery(query)).toList();

  const EmployeesState.initial()
      : query = '',
        result = const AsyncData.nothing();

  const EmployeesState._(this.query, this.result);

  EmployeesState copy({
    String? query,
    AsyncData<List<Employee>>? result,
  }) =>
      EmployeesState._(query ?? this.query, result ?? this.result);

  @override
  List<Object?> get props => [query, result];
}
