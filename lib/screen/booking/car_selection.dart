import 'package:flutter/material.dart';

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({super.key});

  @override
  State<CarSelectionScreen> createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  String? _selectedCar;

  final List<String> _carOptions = [
    'Toyota Vios',
    'Honda Civic',
    'Ford Ranger',
    'Mitsubishi Xpander',
  ];

  void _submitSelection() {
    if (_selectedCar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a car')),
      );
      return;
    }

    // Proceed to customer form or next step
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected car: $_selectedCar')),
    );

    // Example navigation:
    // Navigator.push(context, MaterialPageRoute(builder: (_) => const CustomerFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Car')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isTablet ? 500 : double.infinity),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose your car:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ..._carOptions.map(
                          (car) => RadioListTile<String>(
                        title: Text(car),
                        value: car,
                        groupValue: _selectedCar,
                        onChanged: (value) => setState(() => _selectedCar = value),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitSelection,
                        child: const Text('Continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
