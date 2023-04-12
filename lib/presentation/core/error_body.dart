import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/presentation/core/loader.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/update_bloc.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody(this.failure, {Key? key}) : super(key: key);
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
