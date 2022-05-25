import 'dart:convert';

List<CovidCountryBasedReportModel> covidCountryBasedReportModelFromJson(
    String str) {
  return List<CovidCountryBasedReportModel>.from(json.decode(str).map((x) {
    return CovidCountryBasedReportModel.fromJson(x);
  }));
}

class CovidCountryBasedReportModel {
  CovidCountryBasedReportModel({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    this.continent = Continent.EMPTY,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  int updated;
  String country;
  CountryInfo? countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;
  int population;
  Continent? continent;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  factory CovidCountryBasedReportModel.fromJson(Map<String, dynamic> json) {
    return CovidCountryBasedReportModel(
      updated: json["updated"],
      country: json["country"],
      countryInfo: CountryInfo.fromJson(json["countryInfo"]),
      cases: json["cases"],
      todayCases: json["todayCases"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"],
      todayRecovered: json["todayRecovered"],
      active: json["active"],
      critical: json["critical"],
      casesPerOneMillion: json["casesPerOneMillion"],
      deathsPerOneMillion: json["deathsPerOneMillion"],
      tests: json["tests"],
      testsPerOneMillion: json["testsPerOneMillion"],
      population: json["population"],
      continent: continentValues.map[json["continent"] ?? ""],
      oneCasePerPeople: json["oneCasePerPeople"],
      oneDeathPerPeople: json["oneDeathPerPeople"],
      oneTestPerPeople: json["oneTestPerPeople"],
      activePerOneMillion: json["activePerOneMillion"].toDouble(),
      recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
      criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
    );
  }
}

enum Continent {
  ASIA,
  EUROPE,
  AFRICA,
  NORTH_AMERICA,
  SOUTH_AMERICA,
  AUSTRALIA_OCEANIA,
  EMPTY
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Asia": Continent.ASIA,
  "Australia-Oceania": Continent.AUSTRALIA_OCEANIA,
  "": Continent.EMPTY,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "South America": Continent.SOUTH_AMERICA
});

class CountryInfo {
  CountryInfo({
    required this.id,
    required this.iso2,
    required this.iso3,
    required this.lat,
    required this.long,
    required this.flag,
  });

  int? id;
  String? iso2;
  String? iso3;
  double lat;
  double long;
  String flag;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"] == null ? null : json["_id"],
        iso2: json["iso2"] == null ? null : json["iso2"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        flag: json["flag"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map, [this.reverseMap]);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
