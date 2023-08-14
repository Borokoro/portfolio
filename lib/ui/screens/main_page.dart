import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/bloc/database_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/ui/widgets/button_primary.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DatabaseCubit>(
      create: (context) => DatabaseCubit(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("assets/images/background image.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Column(
                children: [
                  ButtonPrimary(onPressed:() => GoRouter.of(context).push('/projects'), text: 'Projects', height: MediaQuery.of(context).size.height/8, width: MediaQuery.of(context).size.width/4)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
