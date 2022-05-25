import 'dart:convert';

PreviousCovidReportModel previousCovidReportModelFromJson(String str) =>
    PreviousCovidReportModel.fromJson(json.decode(str));

class PreviousCovidReportModel {
  PreviousCovidReportModel({
    required this.cases,
    required this.deaths,
    required this.recovered,
  });

  final Map<String, int> cases;
  final Map<String, int> deaths;
  final Map<String, int> recovered;

  factory PreviousCovidReportModel.fromJson(Map<String, dynamic> json) =>
      PreviousCovidReportModel(
        cases:
            Map.from(json["cases"]).map((k, v) => MapEntry<String, int>(k, v)),
        deaths:
            Map.from(json["deaths"]).map((k, v) => MapEntry<String, int>(k, v)),
        recovered: Map.from(json["recovered"])
            .map((k, v) => MapEntry<String, int>(k, v)),
      );
}
