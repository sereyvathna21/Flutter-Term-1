import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class AddExpenseForm extends StatefulWidget {
  final Function(Expense) onAddExpense;

  const AddExpenseForm({super.key, required this.onAddExpense});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text.trim());

    if (_isFormInvalid(title, amount)) {
      _showErrorDialog();
      return;
    }
    final expense = Expense(
      title: title,
      amount: amount!,
      date: _selectedDate!,
      category: _selectedCategory!,
    );
    widget.onAddExpense(expense);
    Navigator.of(context).pop();
  }

  // Validates form fields
  bool _isFormInvalid(String title, double? amount) {
    return title.isEmpty ||
        amount == null ||
        amount <= 0 ||
        _selectedDate == null ||
        _selectedCategory == null;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Please fill out all fields!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),

          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixText: '\$',
            ),
          ),
          const SizedBox(height: 10),

          // Date Picker
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'No Date Selected!'
                      : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                ),
              ),
              TextButton(
                onPressed: _selectDate,
                child: const Text('Choose Date'),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Category Dropdown
          DropdownButton<Category>(
            value: _selectedCategory,
            hint: const Text('Select Category'),
            isExpanded: true,
            items: Category.values.map((category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Create'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
