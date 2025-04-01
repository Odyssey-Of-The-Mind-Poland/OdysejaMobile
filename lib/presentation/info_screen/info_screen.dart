import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/core/domain/info_category.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_grid.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/widgets/main_button.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CityDataBuilder(
      onData: (data, _) {
        // TODO: sort during data save.
        data.infoGroups.sort(_sort);
        data.infoGroups.forEach(_sortInfo);

        int? selectedIndex;
        return StatefulBuilder(builder: (context, setState) {
          return Scaffold(
            appBar: TopBar(
              title: AppStrings.infoScreenTitle,
              bottom: InfoFilterBar(
                infoCategories: data.infoGroups,
                selectedIndex: selectedIndex,
                onFilterSelected: (value) {
                  setState(() {
                    if (selectedIndex == value) {
                      selectedIndex = null;
                      return;
                    }
                    selectedIndex = value;
                  });
                },
              ),
            ),
            body: InfoGrid(_displayedInfoTiles(
              categories: data.infoGroups,
              selectedIndex: selectedIndex,
            )),
          );
        });
      },
      onFailure: (failure) => Scaffold(
        appBar: TopBar(title: AppStrings.infoScreenTitle),
        body: ErrorBody(failure),
      ),
    );
  }

  _sortInfo(InfoCategory category) => category.info.sort(_sort);

  int _sort(a, b) => a.number.compareTo(b.number);

  List<Info> _displayedInfoTiles({int? selectedIndex, required List<InfoCategory> categories}) =>
      selectedIndex != null
          ? categories[selectedIndex].info
          : categories.expand((e) => e.info).toList();
}

class InfoFilterBar extends StatelessWidget implements PreferredSizeWidget {
  InfoFilterBar({
    super.key,
    required this.infoCategories,
    required this.onFilterSelected,
    required this.selectedIndex,
  });

  final List<InfoCategory> infoCategories;
  final Function(int? value) onFilterSelected;
  final int? selectedIndex;

  static const _height = 68.0;

  @override
  final Size preferredSize = Size.fromHeight(InfoFilterBar._height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: InfoFilterBar._height,
      child: ListView.separated(
        itemCount: infoCategories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
        separatorBuilder: (context, _) => SizedBox(width: 16),
        itemBuilder: (context, i) => MainButton.tertiary(
          label: infoCategories[i].name,
          onPressed: () => onFilterSelected(i),
          isSelected: selectedIndex == i,
        ),
      ),
    );
  }
}
