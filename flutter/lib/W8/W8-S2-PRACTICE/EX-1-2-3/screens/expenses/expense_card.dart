import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  _getCategoryIcon(expense.category),
                  size: 24,
                  color: Colors.blue[700],
                ),
                const SizedBox(width: 8),
                Text(
                  DateFormat.yMMMd().format(expense.date),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood;
      case Category.travel:
        return Icons.flight_takeoff;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
      default:
        return Icons.help_outline;
    }
  }
}
