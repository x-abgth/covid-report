import 'package:covid_report/data/models/previous_covid_report_model.dart';
import 'package:covid_report/data/repositories/previous_covid_report_api_repository.dart';
import 'package:covid_report/data/repositories/world_report_api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/covid_country_based_report_model.dart';
import '../../data/repositories/country_report_api_repository.dart';

part 'world_report_api_event.dart';
part 'world_report_api_state.dart';

class WorldReportApiBloc
    extends Bloc<WorldReportApiEvent, WorldReportApiState> {
  final WorldReportApiRepository worldReportApiRepository;
  final CountryReportApiRepository countryReportApiRepository;
  final PreviousCovidReportApiRepository previousCovidReportApiRepository;

  WorldReportApiBloc({
    required this.worldReportApiRepository,
    required this.countryReportApiRepository,
    required this.previousCovidReportApiRepository,
  }) : super(WorldReportApiInitial()) {
    on<WorldReportApiEvent>((event, emit) async {
      try {
        emit(WorldReportApiLoading());

        // Getting api results from repositories
        Map<String, double>? worldResult =
            await worldReportApiRepository.getWorldData();
        List<CovidCountryBasedReportModel>? countryResult =
            await countryReportApiRepository.getCountryData();
        PreviousCovidReportModel? previousResult =
            await previousCovidReportApiRepository.getPreviousData();

        // Checking if the results are null
        if (countryResult != null &&
            worldResult != null &&
            previousResult != null) {
          addWorldReportInCountryList(
              countryResult: countryResult, worldResult: worldResult);
          emit(WorldReportApiLoaded(
            worldData: worldResult,
            countryData: countryResult,
            previousData: previousResult,
          ));
        } else {
          emit(const WorldReportApiError("An unknown error occured!"));
        }
      } on Exception catch (e) {
        emit(WorldReportApiError(e.toString()));
      }
    });
  }

  addWorldReportInCountryList(
      {required List<CovidCountryBasedReportModel> countryResult,
      required Map<String, double> worldResult}) {
    countryResult.insert(
        0,
        CovidCountryBasedReportModel(
            updated: worldResult["updated"]!.toInt(),
            country: "World Wide",
            countryInfo: null,
            cases: worldResult["cases"]!.toInt(),
            todayCases: worldResult["todayCases"]!.toInt(),
            deaths: worldResult["deaths"]!.toInt(),
            todayDeaths: worldResult["todayDeaths"]!.toInt(),
            recovered: worldResult["recovered"]!.toInt(),
            todayRecovered: worldResult["todayRecovered"]!.toInt(),
            active: worldResult["active"]!.toInt(),
            critical: worldResult["critical"]!.toInt(),
            casesPerOneMillion: worldResult["casesPerOneMillion"]!.toInt(),
            deathsPerOneMillion: worldResult["deathsPerOneMillion"]!.toInt(),
            tests: worldResult["tests"]!.toInt(),
            testsPerOneMillion: worldResult["testsPerOneMillion"]!.toInt(),
            population: worldResult["population"]!.toInt(),
            oneCasePerPeople: worldResult["oneCasePerPeople"]!.toInt(),
            oneDeathPerPeople: worldResult["oneDeathPerPeople"]!.toInt(),
            oneTestPerPeople: worldResult["oneTestPerPeople"]!.toInt(),
            activePerOneMillion: worldResult["activePerOneMillion"] ?? 0,
            recoveredPerOneMillion: worldResult["recoveredPerOneMillion"] ?? 0,
            criticalPerOneMillion: worldResult["criticalPerOneMillion"] ?? 0));
  }
}
