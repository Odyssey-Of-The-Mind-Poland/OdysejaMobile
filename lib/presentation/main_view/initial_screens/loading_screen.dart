import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_mobile/presentation/core/error_body.dart';
import 'package:odyssey_mobile/presentation/main_view/initial_screens/bloc/update_bloc.dart';
import 'package:odyssey_mobile/app/router.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UpdateBloc, UpdateState>(
        listener: (context, state) {
          if (state is UpdateFinished) {
            context.router.replaceAll([const MainView()]);
          }
        },
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) {
            if (state is UpdateFailed) {
              return ErrorBody(state.failure);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
