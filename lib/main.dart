import 'package:flutter/material.dart';
import 'package:travel_expenses/widgets/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Expenses(),
        )
    ),
  );
  
}