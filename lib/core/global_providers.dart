import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/database_cubit.dart';


class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
   super.key,
   required this.child,
});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => DatabaseCubit()),
    ],
        child: child
    );
  }
}
