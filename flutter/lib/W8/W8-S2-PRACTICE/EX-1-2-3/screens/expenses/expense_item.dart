import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_card.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onDismissed,
  });

  final Expense expense;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(expense.id),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        onDismissed();
      },
      background: const DismissBackground(),
      child: ExpenseCard(expense: expense),
    );
  }
}

class DismissBackground extends StatelessWidget {
  const DismissBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
