import 'package:calculator/ui/app_theme.dart';
import 'package:calculator/ui/pages/calc_view.dart';
import 'package:calculator/ui/view_models/calc_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  _setupDepencies();
  runApp(CalculatorApp());
}

//------------------------------------------------------------------------------
void _setupDepencies() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<CalcViewModel>(() => CalcViewModel());
}

//------------------------------------------------------------------------------
class CalculatorApp extends StatelessWidget {
  //
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(),
      home: CalcView(),
    );
  }
}

//------------------------------------------------------------------------------
