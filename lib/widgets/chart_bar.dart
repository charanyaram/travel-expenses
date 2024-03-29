import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.proportion});

  final double proportion;

  @override
  Widget build(context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: FractionallySizedBox(
          heightFactor: proportion,
          child: DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
                color: isDarkMode?
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.7):
                  Theme.of(context).colorScheme.onPrimaryContainer,
                ),
            
          ),
        ),
      ),
    );
  }
}
