import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/covid_country_based_report_model.dart';
import 'package:covid_report/logic/world_report_api_bloc/world_report_api_bloc.dart';
import '../../../../data/providers/country_list_index_provider.dart';

class HomeScreenHeaderWidget extends StatefulWidget {
  final String appTitle;
  final WorldReportApiLoaded state;

  const HomeScreenHeaderWidget({
    Key? key,
    required this.appTitle,
    required this.state,
  }) : super(key: key);

  @override
  State<HomeScreenHeaderWidget> createState() => _HomeScreenHeaderWidgetState();
}

class _HomeScreenHeaderWidgetState extends State<HomeScreenHeaderWidget> {
  String? defaultDropDownVal;
  int indexOfCountryList = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Text(
            widget.appTitle,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(3),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                value:
                    defaultDropDownVal ?? widget.state.countryData[0].country,
                items: widget.state.countryData.map((item) {
                  return DropdownMenuItem(
                    value: item.country.toString(),
                    child: Text(item.country),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    defaultDropDownVal = val.toString();
                  });
                  getIndexOfCountry(
                      countryList: widget.state.countryData,
                      value: val.toString());
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  getIndexOfCountry({
    required List<CovidCountryBasedReportModel> countryList,
    required String value,
  }) {
    for (int i = 0; i < countryList.length; i++) {
      if (countryList[i].country.contains(value)) {
        Provider.of<CountryListIndexProvider>(context, listen: false)
            .updateCountryIndex(val: i);
      }
    }
  }
}
