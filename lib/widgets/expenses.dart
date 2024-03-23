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
      context: context,
      builder: (modalContext) => const NewExpense(),
    );
  }

  @override
  Widget build(context) {
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
          Expanded(child: ExpensesList(allExpenses: _myExpenses))
        ],
      ),
    );
  }
}
