import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/app.dart';
import 'package:marvel_dd360_test/app/app_module.dart';

void main() => runApp(
      ModularApp(
        module: AppModule(),
        child: const MarvelApp(),
      ),
    );
