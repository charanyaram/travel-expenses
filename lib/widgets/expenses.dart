import 'package:flutter/material.dart';
import 'package:travel_expenses/widgets/expenses_list/expense_list.dart';
import 'package:travel_expenses/models/expense.dart';
import 'package:travel_expenses/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses();

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _myExpenses = [
    Expense(
      title: 'Valentine Dinner',
      amount: 399.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Sky Diving',
      amount: 500.00,
      date: DateTime.now(),
      category: Category.experience,
    ),
  ];

  void _openAddExpenseItemOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (modalContext) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _myExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _myExpenses.indexOf(expense);
    setState(() {
      _myExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted'),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _myExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(context) {
    Widget mainScreenContent = const Center(
      child: Text(' No Expenses here.. Please add some'),
    );

    if (_myExpenses.isNotEmpty) {
      mainScreenContent = ExpensesList(
        allExpenses: _myExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Expenses Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseItemOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart goes here"),
          const SizedBox(height: 30),
          Expanded(child: mainScreenContent)
        ],
      ),
    );
  }
}
