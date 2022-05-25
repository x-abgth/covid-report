import 'package:covid_report/core/constants.dart';
import 'package:covid_report/data/models/covid_country_based_report_model.dart';
import 'package:http/http.dart' as http;

class CountryReportApiRepository {
  Future<List<CovidCountryBasedReportModel>?> getCountryData() async {
    final client = http.Client();

    var uri = Uri.parse(countryUrl);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return covidCountryBasedReportModelFromJson(response.body);
    }
    return null;
  }
}
