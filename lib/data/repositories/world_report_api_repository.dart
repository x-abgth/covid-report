import 'package:covid_report/core/constants.dart';
import 'package:covid_report/data/models/covid_country_based_report_model.dart';
import 'package:http/http.dart' as http;

import '../models/covid_world_based_report_model.dart';

class WorldReportApiRepository {
  Future<Map<String, double>?> getWorldData() async {
    final client = http.Client();

    var uri = Uri.parse(worldWideReportUrl);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return covidWorldBasedReportModelFromJson(response.body);
    }
    return null;
  }
}
