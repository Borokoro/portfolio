import 'package:flutter/material.dart';
import 'package:portfolio/core/global_providers.dart';
import 'package:portfolio/core/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio',
          routerConfig: Routers().router,
        ));
  }
}
