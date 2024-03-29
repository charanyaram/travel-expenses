import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense.dart';
import 'package:travel_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  // this categorises the expenses, takes all the expenses, and creates a list with indivdual expenses per category
  List<AllExpensesContainer> get categoryExpenses {
    return [
      AllExpensesContainer.forCategory(expenses, Category.food),
      AllExpensesContainer.forCategory(expenses, Category.experience),
      AllExpensesContainer.forCategory(expenses, Category.shopping),
      AllExpensesContainer.forCategory(expenses, Category.stay),
    ];
  }

  double get highestExpense {
    double highestExpense = 0;
    for(final category in categoryExpenses){
      if(category.sumOfExpenses > highestExpense) highestExpense=category.sumOfExpenses;
    }
    return highestExpense;
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final categoryExpense in categoryExpenses)
                ChartBar(proportion: categoryExpense.sumOfExpenses ==0 ? 0: categoryExpense.sumOfExpenses/highestExpense)
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: categoryExpenses.map(
            (categoryExpense) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  categoryIcons[categoryExpense.category],
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ).toList()
        ),
      ]),
    );
  }
}
