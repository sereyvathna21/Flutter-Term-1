import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemove,
  });

  final List<Expense> expenses;
  final void Function(int index) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseItem(
          expense: expenses[index],
          onDismissed: () => onRemove(index),
        );
      },
    );
  }
}
