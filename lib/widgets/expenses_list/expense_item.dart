import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                children: [
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 10),
                      Text(
                        expense.formattedDate,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontStyle: FontStyle.italic,
                                ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
