import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/strings.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.favScreenTitle)),
      body: Center(child: Text('FavouritesScreen')),
    );
  }
}
