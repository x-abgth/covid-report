import 'package:covid_report/presentation/screens/home_screen/widgets/home_screen_country_report_list.dart';
import 'package:covid_report/presentation/screens/home_screen/widgets/home_screen_header_widget.dart';
import 'package:covid_report/presentation/screens/home_screen/widgets/home_screen_info_card.dart';
import 'package:covid_report/presentation/screens/home_screen/widgets/home_screen_map_widget.dart';
import 'package:covid_report/presentation/screens/home_screen/widgets/home_screen_world_wide_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../data/providers/country_list_index_provider.dart';
import '../../../../logic/world_report_api_bloc/world_report_api_bloc.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  final String appTitle = "Covid Reports";
  final List<String> countries = [
    "World Wide",
    "USA",
    "UK",
    "INDIA",
    "PAKISTAN",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WorldReportApiBloc, WorldReportApiState>(
      builder: (context, state) {
        if (state is WorldReportApiInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WorldReportApiLoaded) {
          return SizedBox(
            height: size.height,
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      HomeScreenHeaderWidget(
                        appTitle: appTitle,
                        state: state,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: HomeScreenInfoCard(
                            title: "Coronavirus Cases",
                            currentVal:
                                "+${humanReadableNumber(state.countryData[Provider.of<CountryListIndexProvider>(context, listen: true).countryIndex].todayCases.toDouble())}",
                            totalVal:
                                "${humanReadableNumber(state.countryData[Provider.of<CountryListIndexProvider>(context, listen: true).countryIndex].cases.toDouble())} Total",
                          )),
                          const SizedBox(width: 10),
                          Expanded(
                              child: HomeScreenInfoCard(
                            title: "Recovered",
                            currentVal:
                                "+${humanReadableNumber(state.countryData[Provider.of<CountryListIndexProvider>(context, listen: true).countryIndex].todayRecovered.toDouble())}",
                            totalVal:
                                "${humanReadableNumber(state.countryData[Provider.of<CountryListIndexProvider>(context, listen: true).countryIndex].recovered.toDouble())} Total",
                            isRecovered: true,
                          )),
                          const SizedBox(width: 10),
                          Expanded(
                              child: HomeScreenInfoCard(
                            title: "Deaths",
                            currentVal:
                                "+${humanReadableNumber(state.countryData[Provider.of<CountryListIndexProvider>(context, listen: true).countryIndex].todayDeaths.toDouble())}",
                            totalVal:
                                "${humanReadableNumber(state.countryData[Provider.of<CountryListIndexProvider>(context, listen: true).countryIndex].deaths.toDouble())} Total",
                          )),
                        ],
                      ),
                      const Flexible(child: HomeScreenMapWidget()),
                      // Map
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        height: size.height / 1.15,
                        margin: const EdgeInsets.only(left: 24.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Live Cases by Country",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 18,
                              ),
                            ),
                            HomeScreenCountryReportList(state: state),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "World wide new cases",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 4.7,
                              width: size.width,
                              child: HomeScreenWorldWideChart(
                                  state: state.previousData.cases),
                            ),
                          ],
                        ),
                      ),
                      // graph of cases
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is WorldReportApiError) {
          return Center(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Text(
                state.errorMsg,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          );
        }
        // Add shimmer effect
        return const SizedBox();
      },
    );
  }

  String humanReadableNumber(double item) {
    var formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 1,
      locale: 'en_US',
      symbol: '',
    ).format(item).toLowerCase();
    return formattedNumber;
  }
}
