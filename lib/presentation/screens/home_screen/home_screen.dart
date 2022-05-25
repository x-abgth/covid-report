import 'package:covid_report/logic/world_report_api_bloc/world_report_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/screen_helper/responsive_helper.dart';
import 'responsive/home_screen_desktop.dart';
import 'responsive/home_screen_mobile.dart';
import 'responsive/home_screen_tablet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getCovidDatas() {
    // context.read<CountryReportApiBloc>().add(OnCountryReportApiDataRequested());
    context.read<WorldReportApiBloc>().add(OnWorldReportApiDataRequested());
  }

  @override
  Widget build(BuildContext context) {
    getCovidDatas();
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: ResponsiveHelper(
            mobileView: HomeScreenMobile(),
            tabletView: HomeScreenTablet(),
            desktopView: HomeScreenDesktop(),
          ),
        ),
      ),
    );
  }
}
