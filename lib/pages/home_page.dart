import 'package:betalent/bloc/employees_cubit.dart';
import 'package:betalent/widgets/app_search_bar.dart';
import 'package:betalent/widgets/employee_table.dart';
import 'package:betalent/widgets/async_data_builder.dart';
import 'package:betalent/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: PageTitle('Funcionários'),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppSearchBar(
              onChanged: (value) =>
                  context.read<EmployeesCubit>().search(value),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<EmployeesCubit, EmployeesState>(
              builder: (context, state) {
                return AsyncDataBuilder(
                  state: state.result,
                  builder: (context, _) {
                    return EmployeeTable(state.filtered!);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
