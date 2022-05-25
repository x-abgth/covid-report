import 'package:covid_report/data/providers/country_list_index_provider.dart';
import 'package:covid_report/data/repositories/country_report_api_repository.dart';
import 'package:covid_report/data/repositories/previous_covid_report_api_repository.dart';
import 'package:covid_report/data/repositories/world_report_api_repository.dart';
import 'package:covid_report/logic/world_report_api_bloc/world_report_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covid_report/presentation/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CountryListIndexProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CountryReportApiRepository>(
          create: (context) => CountryReportApiRepository(),
        ),
        RepositoryProvider<WorldReportApiRepository>(
          create: (context) => WorldReportApiRepository(),
        ),
        RepositoryProvider<PreviousCovidReportApiRepository>(
          create: (context) => PreviousCovidReportApiRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WorldReportApiBloc>(
              create: (context) => WorldReportApiBloc(
                    worldReportApiRepository: WorldReportApiRepository(),
                    countryReportApiRepository: CountryReportApiRepository(),
                    previousCovidReportApiRepository:
                        PreviousCovidReportApiRepository(),
                  )),
        ],
        child: MaterialApp(
          title: 'Covid Report App',
          debugShowCheckedModeBanner: false,
          // debugShowMaterialGrid: true,
          // showSemanticsDebugger: true,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0XFFEAEAEA),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
