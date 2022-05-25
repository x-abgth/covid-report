part of 'world_report_api_bloc.dart';

abstract class WorldReportApiState extends Equatable {
  const WorldReportApiState();
}

class WorldReportApiInitial extends WorldReportApiState {
  @override
  List<Object?> get props => [];
}

class WorldReportApiLoading extends WorldReportApiState {
  @override
  List<Object?> get props => [];
}

class WorldReportApiLoaded extends WorldReportApiState {
  final Map<String, double> worldData;
  final List<CovidCountryBasedReportModel> countryData;
  final PreviousCovidReportModel previousData;
  const WorldReportApiLoaded({
    required this.worldData,
    required this.countryData,
    required this.previousData,
  });
  @override
  List<Object?> get props => [worldData, countryData];
}

class WorldReportApiError extends WorldReportApiState {
  final String errorMsg;

  const WorldReportApiError(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
