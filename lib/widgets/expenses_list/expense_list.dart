import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense.dart';
import 'package:travel_expenses/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.allExpenses, required this.onRemoveExpense});


  final List<Expense> allExpenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (listContext, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(allExpenses[index],);
          print(direction); //tried to see what gets printed when we swipe left and right, may be you could use this to have background colours?
        },
        key: ValueKey(allExpenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        child: ExpenseItem(allExpenses[index]),
        ) 
      
    );
  }
}
