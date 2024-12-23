import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        (selectedCity) {
                      context.read<CityDataBloc>().add(FetchCityData(selectedCity));
                    },
                  );
                },
                child: Container(
                  width: 150,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    border: Border.all(color: Colors.orangeAccent, width: 2),
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
                        Icon(Icons.location_pin, color: AppColors.grey200, size: 22),
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

  void _showCitySelection(BuildContext context, List<CityHiveModel> cities, Function(int) onCitySelected) {
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
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.pureWhite,
            border: Border.all(color: Colors.orangeAccent, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select a City',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: cities.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (context, index) {
                  final city = cities[index];
                  return ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text(city.name),
                    onTap: () {
                      onCitySelected(city.id);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
