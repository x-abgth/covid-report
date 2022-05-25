part of 'world_report_api_bloc.dart';

abstract class WorldReportApiEvent extends Equatable {
  const WorldReportApiEvent();
}

class OnWorldReportApiDataRequested extends WorldReportApiEvent {
  @override
  List<Object?> get props => [];
}
