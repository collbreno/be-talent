import 'package:betalent/models/employee.dart';
import 'package:betalent/repository/i_app_repository.dart';
import 'package:betalent/models/async_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  final IAppRepository repository;
  EmployeesCubit(this.repository) : super(const EmployeesState.initial());

  void load() async {
    emit(state.copy(result: const AsyncData.loading()));
    try {
      final result = await repository.getEmployees();
      emit(state.copy(result: AsyncData.withData(result)));
    } catch (e) {
      emit(state.copy(result: AsyncData.withError(e)));
      rethrow;
    }
  }

  void search(String query) {
    emit(state.copy(query: query));
  }
}
