import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/consts/light_colors.dart';
import 'package:odyssey_mobile/data/db/hive/models/city.dart';

import '../../consts/themes.dart';
import 'bloc/city_bloc.dart';
import 'bloc/city_data_bloc.dart';

class CitySelectButton extends StatelessWidget {
  const CitySelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 96,
      right: 16,
      child: BlocBuilder<CityDataBloc, CityDataState>(
        builder: (context, cityDataState) {
          return BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              String cityName = cityDataState is CityDataSuccess
                  ? cityDataState.cityData.cityName
                  : 'Select City';
              return GestureDetector(
                onTap: () {
                  List<CityHiveModel> cities = [];
                  if (state is CitySuccess) {
                    cities = state.cities;
                  }

                  _showCitySelection(
                    context,
                    cities,
                    cityName,
                    (selectedCity) {
                      context
                          .read<CityDataBloc>()
                          .add(FetchCityData(selectedCity));
                    },
                  );
                },
                child: Container(
                  width: 150,
                  height: 58,
                  decoration: BoxDecoration(
                    color: LightColors.appColors.primary.color500,
                    border: Border.all(
                        color: LightColors.appColors.primary.color700,
                        width: 2),
                    borderRadius: BorderRadius.circular(80),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_pin,
                            color: AppColors.grey200, size: 22),
                        SizedBox(width: 5),
                        Text(
                          cityName,
                          style: TextStyle(
                            color: AppColors.grey200,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showCitySelection(BuildContext context, List<CityHiveModel> cities,
      String selectedCityName, Function(int) onCitySelected) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        if (cities.isEmpty) {
          return Center(child: Text('No cities available.'));
        }

        return Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 6,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: LightColors.appColors.universal.grey.color100,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: LightColors.appColors.universal.grey.color100,
                  border: Border.all(
                      color: LightColors.appColors.universal.grey.color300,
                      width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Wybór eliminacji',
                            style: TextStyle(
                                fontSize: 20,
                                color: LightColors
                                    .appColors.universal.grey.color700,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  LightColors.appColors.universal.grey.color300,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: LightColors
                                      .appColors.universal.grey.color300,
                                ),
                                child: Icon(
                                  size: 22,
                                  Icons.close,
                                  color: LightColors
                                      .appColors.universal.grey.color500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        final city = cities[index];
                        final isSelected = city.name == selectedCityName;

                        final bgColor = isSelected
                            ? LightColors.appColors.primary.color500
                            : Colors.transparent;
                        final textColor = isSelected
                            ? Colors.white
                            : LightColors.appColors.universal.grey.color700;
                        final iconColor = isSelected
                            ? Colors.white
                            : LightColors.appColors.universal.grey.color400;

                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: bgColor,
                          ),
                          child: ListTile(
                            leading: Icon(Icons.location_pin, color: iconColor),
                            trailing: isSelected
                                ? Icon(Icons.check, color: Colors.white)
                                : null,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              city.name,
                              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              onCitySelected(city.id);
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
