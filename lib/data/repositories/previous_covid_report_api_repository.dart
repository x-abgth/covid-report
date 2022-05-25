import 'package:http/http.dart' as http;
import '../models/previous_covid_report_model.dart';
import 'package:covid_report/core/constants.dart';

class PreviousCovidReportApiRepository {
  Future<PreviousCovidReportModel?> getPreviousData() async {
    final client = http.Client();

    var uri = Uri.parse(worldCovidReportTillDateUrl);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return previousCovidReportModelFromJson(response.body);
    }
    return null;
  }
}
