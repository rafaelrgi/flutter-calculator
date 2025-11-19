import 'package:calculator/ui/app_theme.dart';
import 'package:calculator/ui/view_models/calc_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CalcButton extends StatelessWidget {
  //
  final String label;
  final Color color;

  CalcViewModel get calculatorViewModel => GetIt.instance<CalcViewModel>();

  const CalcButton(
    this.label, {
    this.color = AppTheme.defaultButtonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return label.isEmpty
        ? const SizedBox.shrink()
        : InkWell(
            enableFeedback: false,
            onTap: () => calculatorViewModel.onButton(label),
            child: Container(
              alignment: .center,
              decoration: BoxDecoration(
                border: .all(color: AppTheme.buttonBorderColor, width: 1),
              ),
              child: Text(
                label,
                style: theme.textTheme.headlineSmall?.copyWith(color: color),
              ),
            ),
          );
  }
}
