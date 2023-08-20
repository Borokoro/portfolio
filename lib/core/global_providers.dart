import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/database/database_cubit.dart';
import 'package:portfolio/bloc/images/images_cubit.dart';


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
      BlocProvider(create: (context) => ImagesCubit()),
    ],
        child: child
    );
  }
}
