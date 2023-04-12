import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/asset_paths.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/presentation/components/image_tile.dart';
import 'package:odyssey_mobile/app/strings.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    child: const ImageTile(AssetPaths.eventLogo, color: AppColors.omerBlue),
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
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 120,
                child: Row(children: const [
                  Expanded(child: ImageTile(AssetPaths.sponsor1)),
                  SizedBox(width: 16),
                  Expanded(child: ImageTile(AssetPaths.sponsor5)),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ImageTile(_imageGrid[index]!),
                  addAutomaticKeepAlives: false,
                  childCount: 12,
                ),
              ),
            ),
          ],
        ));
  }
}

const Map<int, String> _imageGrid = {
  0: AssetPaths.sponsor2,
  1: AssetPaths.sponsor3,
  2: AssetPaths.sponsor8,
  3: AssetPaths.sponsor6,
  4: AssetPaths.sponsor11,
  5: AssetPaths.sponsor7,
  6: AssetPaths.sponsor10,
  7: AssetPaths.sponsor9,
  8: AssetPaths.sponsor12,
  9: AssetPaths.sponsor13,
  10: AssetPaths.sponsor14,
  11: AssetPaths.sponsor15,
};
