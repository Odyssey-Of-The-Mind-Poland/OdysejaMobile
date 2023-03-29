import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/presentation/core/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/core/error_body.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_grid.dart';
import 'package:odyssey_mobile/app/strings.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CityDataBuilder(
      onData: (data, _) {
        return DefaultTabController(
          length: data.infoGroups.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.infoScreenTitle),
              bottom: TabBar(tabs: data.infoGroups.map((e) => Text(e.name)).toList()),
            ),
            body: TabBarView(children: data.infoGroups.map((e) => InfoGrid(e)).toList()),
          ),
        );
      },
      onFailure: (failure) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.infoScreenTitle),
        ),
        body: ErrorBody(failure),
      ),
    );
  }
}
