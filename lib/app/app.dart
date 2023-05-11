import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/core/colors/colors.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marvel App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
          ),
          primaryColor: AppColors.primary,
          indicatorColor: AppColors.primary,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.primary,
          )),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
