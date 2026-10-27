import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/city.dart';
import 'package:odyssey_mobile/design_system/components/menu_item.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

/// Opens the city selection sheet using the existing [CityBloc] (list of cities) and
/// [CityDataBloc] (currently loaded city), and loads data of the chosen city.
Future<void> showCityPickerSheet(BuildContext context) {
  final cityBloc = context.read<CityBloc>();
  final cityDataBloc = context.read<CityDataBloc>();

  final cityState = cityBloc.state;
  final dataState = cityDataBloc.state;

  return showOotmBottomSheet<void>(
    context: context,
    routeName: 'CityPickerSheet',
    child: CityPickerSheet(
      cities: cityState is CitySuccess ? cityState.cities : const [],
      selectedCityId: dataState is CityDataSuccess ? dataState.cityData.cityId : null,
      onSelected: (id) => cityDataBloc.add(FetchCityData(id)),
    ),
  );
}

/// Content of the city selection bottom sheet.
class CityPickerSheet extends StatelessWidget {
  const CityPickerSheet({
    required this.cities,
    required this.selectedCityId,
    required this.onSelected,
    super.key,
  });

  final List<CityHiveModel> cities;
  final int? selectedCityId;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        const OotmBottomSheetHeader(text: AppStrings.cityPickerTitle),
        if (cities.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              AppStrings.cityPickerEmpty,
              textAlign: TextAlign.center,
              style: Theme.of(context).t.bodyMediumRegular,
            ),
          )
        else
          for (final city in cities)
            MenuItem(
              title: city.name,
              icon: OotmIcons.location,
              selected: city.id == selectedCityId,
              onTap: () {
                onSelected(city.id);
                Navigator.of(context).pop();
              },
            ),
      ],
    );
  }
}
