import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/home_screen/image_tile.dart';
import 'package:odyssey_mobile/consts/strings.dart';
import 'package:odyssey_mobile/presentation/home_screen/next_performance.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CityDataBuilder(onData: (data, _) {
      return Scaffold(
        backgroundColor: AppColors.shadowGrey,
        appBar: AppBar(
            title: const Text(AppStrings.homeScreenTitle), centerTitle: true),
        body: CustomScrollView(
          cacheExtent: 200,
          slivers: [
            SliverToBoxAdapter(child: NextPerformance()),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
                    height: size.width,
                    child: ImageTile(data.sponsors[0][0].id,
                        color: AppColors.omerBlue),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      'Nasi Partnerzy',
                      style: AppTextStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            ...data.sponsors.skip(1).map((row) {
              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: row.length,
                    childAspectRatio: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index < row.length) {
                        return ImageTile(row[index].id);
                      }
                      return null;
                    },
                    childCount: row.length,
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
