import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/presentation/components/loader.dart';
import 'package:odyssey_mobile/features/update_data/bloc/update_bloc.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody(this.failure, {super.key});
  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UpdateBloc, UpdateState>(
        builder: (context, state) {
          if (state is UpdateLoading) {
            return const Loader();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(failure.errorMessage, textAlign: TextAlign.center),
                TextButton(
                    onPressed: () => context.read<UpdateBloc>().add(const BootstrapEvent()),
                    child: const Text(
                      'Odśwież',
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
