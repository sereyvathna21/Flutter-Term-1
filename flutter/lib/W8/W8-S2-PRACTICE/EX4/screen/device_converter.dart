import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _dollarController = TextEditingController();
  String _convertedValue = '';
  String? _selectedCurrency;
  final Map<String, double> _conversionRates = {
    'Euro': 0.85,
    'Riels': 4100.0,
    'Dong': 24000.0,
  };

  void _convertCurrency() {
    final enteredAmount = double.tryParse(_dollarController.text.trim());
    if (_selectedCurrency != null &&
        enteredAmount != null &&
        enteredAmount > 0) {
      setState(() {
        final rate = _conversionRates[_selectedCurrency]!;
        _convertedValue = (enteredAmount * rate).toStringAsFixed(2);
      });
    } else {
      setState(() {
        _convertedValue = 'Invalid input or currency not selected!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Currency Converter",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _dollarController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Enter amount in dollars',
                prefixText: '\$ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedCurrency,
              hint: const Text('Select Currency'),
              isExpanded: true,
              items: _conversionRates.keys.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCurrency = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                _convertedValue.isEmpty
                    ? 'Conversion result will appear here'
                    : 'Converted Value: $_convertedValue',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
