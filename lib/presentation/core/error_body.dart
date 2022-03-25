import 'package:flutter/material.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody(this.failure, {Key? key}) : super(key: key);
  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(failure.errorMessage));
  }
}
