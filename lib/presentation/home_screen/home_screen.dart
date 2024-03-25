import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/data/api/models/sponsor.dart';
// import 'package:odyssey_mobile/consts/asset_paths.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/image_tile.dart';
import 'package:odyssey_mobile/consts/strings.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CityDataBuilder(onData: (data, _) {
      return buildScaffold(size, data.sponsors);
    });
  }

  Scaffold buildScaffold(Size size, List<List<SponsorModelApi>> sponsors) {
    return Scaffold(
        backgroundColor: AppColors.shadowGrey,
        appBar: AppBar(title: const Text(AppStrings.homeScreenTitle), centerTitle: true),
        body: CustomScrollView(
          cacheExtent: 200,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
                    height: size.width,
                    child: ImageTile(sponsors[0][0].id.toString(), color: AppColors.omerBlue),
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
            ...sponsors.skip(1).map((row) {
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
                        return ImageTile(row[index].id.toString());
                      }
                      return null;
                    },
                    childCount: row.length,
                  ),
                ),
              );
            }).toList(),
          ],
          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: const EdgeInsets.all(16),
          //     height: 120,
          //     child: Row(children: const [
          //       Expanded(child: ImageTile(AssetPaths.sponsor1)),
          //       SizedBox(width: 16),
          //       Expanded(child: ImageTile(AssetPaths.sponsor5)),
          //     ]),
          //   ),
          // ),
          // SliverPadding(
          //   padding:
          //       const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          //   sliver: SliverGrid(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //       childAspectRatio: 1,
          //       crossAxisSpacing: 16,
          //       mainAxisSpacing: 16,
          //     ),
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) => ImageTile(_imageGrid[index]!),
          //       addAutomaticKeepAlives: false,
          //       childCount: 12,
          //     ),
          //   ),
          // ),
        ));
  }
}
