import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/domain/failure.dart';
import 'package:odyssey_mobile/presentation/components/loader.dart';
import 'package:odyssey_mobile/presentation/initial_screens/bloc/update_bloc.dart';

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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(failure.errorMessage),
              TextButton(
                  onPressed: () => context.read<UpdateBloc>().add(const StartUpdateProcess(true)),
                  child: const Text(
                    'Odśwież',
                    textAlign: TextAlign.center,
                  )),
            ],
          );
        },
      ),
    );
  }
}
