import 'package:betalent/bloc/employees_cubit.dart';
import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/pages/home_page.dart';
import 'package:betalent/repository/app_repository.dart';
import 'package:betalent/repository/i_app_repository.dart';
import 'package:betalent/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App(AppRepository(ApiUtils.dio)));
}

class App extends StatelessWidget {
  final IAppRepository repository;
  const App(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAppRepository>.value(
      value: repository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BeTalent',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bluePrimary),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) =>
              EmployeesCubit(context.read<IAppRepository>())..load(),
          child: const HomePage(),
        ),
      ),
    );
  }
}
