import 'package:flutter/material.dart';

// Temp widget
class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Brak danych :('));
  }
}
