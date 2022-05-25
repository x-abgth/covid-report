import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'previous_covid_report_api_event.dart';
part 'previous_covid_report_api_state.dart';

class PreviousCovidReportApiBloc extends Bloc<PreviousCovidReportApiEvent, PreviousCovidReportApiState> {
  PreviousCovidReportApiBloc() : super(PreviousCovidReportApiInitial()) {
    on<PreviousCovidReportApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
