import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'add_expense.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  Expense? _lastRemovedExpense;
  int? _lastRemovedIndex;

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => AddExpenseForm(
        onAddExpense: (Expense expense) {
          setState(() {
            _registeredExpenses.add(expense);
          });
        },
      ),
    );
  }

  void _removeExpense(int index) {
    setState(() {
      _lastRemovedExpense = _registeredExpenses[index];
      _lastRemovedIndex = index;
      _registeredExpenses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              if (_lastRemovedExpense != null && _lastRemovedIndex != null) {
                _registeredExpenses.insert(
                  _lastRemovedIndex!,
                  _lastRemovedExpense!,
                );
              }
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Expenses App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseModal,
          ),
        ],
      ),
      body: _registeredExpenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ExpensesList(
              expenses: _registeredExpenses,
              onRemove: _removeExpense,
            ),
    );
  }
}
