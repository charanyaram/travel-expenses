import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense.dart';

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

  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Travel Expenses"),
          Text("Chart goes here"),
          Text("List of Expenses"),
        ],
      ),
    );
  }
}
