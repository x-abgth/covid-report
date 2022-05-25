import 'package:flutter/material.dart';
import '../../../../logic/world_report_api_bloc/world_report_api_bloc.dart';

class HomeScreenCountryReportList extends StatelessWidget {
  final WorldReportApiLoaded state;
  const HomeScreenCountryReportList({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Sorting the list in ascending order
    state.countryData.sort((a, b) => a.cases > b.cases ? -1 : 1);
    return Container(
      height: size.height / 2,
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        // Because index[0] is World report, not country
        itemCount: state.countryData.length - 1,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8.0),
          color: index % 2 == 0 ? Colors.white : const Color(0xFFF3F1FA),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.countryData[index + 1].country,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                state.countryData[index + 1].cases.toString(),
                style: TextStyle(
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
