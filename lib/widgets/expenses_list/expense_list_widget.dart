import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.allExpenses});

  final List<Expense> allExpenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (listContext, index) => Text(allExpenses[index].title),
    );
  }
}
