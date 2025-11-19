import 'package:calculator/ui/app_theme.dart';
import 'package:calculator/ui/view_models/calc_view_model.dart';
import 'package:calculator/ui/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CalcView extends StatelessWidget {
  //
  CalcViewModel get calculatorViewModel => GetIt.instance<CalcViewModel>();

  const CalcView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Center(
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          children: [
            Container(
              width: double.infinity,
              margin: const .symmetric(vertical: 2, horizontal: 16),
              padding: const .all(10),
              decoration: BoxDecoration(
                border: .all(color: AppTheme.displayBorderColor, width: 1),
              ),
              child: ListenableBuilder(
                listenable: calculatorViewModel,
                builder: (_, child) {
                  return Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Text(
                        calculatorViewModel.previous,
                        textAlign: .left,
                        style: textTheme.bodySmall,
                        overflow: .ellipsis,
                      ),
                      Text(
                        calculatorViewModel.display,
                        textAlign: .right,
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppTheme.displayColor,
                        ),
                        overflow: .ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 1.1,
              ),
              padding: const .symmetric(horizontal: 16),
              children: [
                CalcButton(''), //yes, empty btn, just for layout reasons
                CalcButton('C', color: AppTheme.clearButtonColor),
                CalcButton('CE', color: AppTheme.clearButtonColor),
                CalcButton('÷', color: AppTheme.operatorButtonColor),

                CalcButton('7'),
                CalcButton('8'),
                CalcButton('9'),
                CalcButton('x', color: AppTheme.operatorButtonColor),

                CalcButton('4'),
                CalcButton('5'),
                CalcButton('6'),
                CalcButton('-', color: AppTheme.operatorButtonColor),

                CalcButton('1'),
                CalcButton('2'),
                CalcButton('3'),
                CalcButton('+', color: AppTheme.operatorButtonColor),

                CalcButton('±', color: AppTheme.operatorButtonColor),
                CalcButton('0'),
                CalcButton('.', color: AppTheme.decimalSeparatorButtonColor),
                CalcButton('=', color: AppTheme.totalButtonColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
