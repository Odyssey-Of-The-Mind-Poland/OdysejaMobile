import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_grid.dart';
import 'package:odyssey_mobile/l10n/strings.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CityDataBuilder(
      onData: (data, _) {
        return DefaultTabController(
          length: data.infoGroups.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.infoScreenTitle),
              bottom: TabBar(
                  tabs: data.infoGroups
                      .map((e) => Text(e.name, textAlign: TextAlign.center))
                      .toList()),
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
