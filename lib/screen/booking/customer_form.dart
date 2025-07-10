import 'package:flutter/material.dart';
import 'package:booking/models/booking.dart';

class CustomerFormScreen extends StatefulWidget {
  const CustomerFormScreen({super.key});

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();

  bool _hasErrors = false;
  bool _showValidationMessage = false;

  bool _validateFields() {
    setState(() {
      _hasErrors = _firstNameController.text.trim().isEmpty ||
          _lastNameController.text.trim().isEmpty ||
          _phoneController.text.trim().isEmpty ||
          _dateController.text.trim().isEmpty ||
          _timeController.text.trim().isEmpty ||
          _plateController.text.trim().isEmpty;
      _showValidationMessage = _hasErrors;
    });

    return !_hasErrors;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF2299A2),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(77, 0, 0, 0),
                  offset: Offset(0, 4),
                  blurRadius: 4)
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () => Navigator.pop(context)),
            title: const Text(
              'E&C\nCarwash',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Cinzel',
                color: Color(0xFF006B79),
                height: 1.1,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.menu, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/your_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Customer Form',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(offset: Offset(1, 1), blurRadius: 2),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_showValidationMessage)
                      const Center(
                        child: Text(
                          'Please fill in all required fields.',
                          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                        ),
                      ),
                    const SizedBox(height: 10),
                    const SectionTitle('Customer Information'),
                    Row(
                      children: [
                        Expanded(
                            child: CustomInput(
                                label: 'First Name',
                                controller: _firstNameController,
                                showError: _hasErrors && _firstNameController.text.trim().isEmpty)),
                        const SizedBox(width: 10),
                        Expanded(
                            child: CustomInput(
                                label: 'Last Name',
                                controller: _lastNameController,
                                showError: _hasErrors && _lastNameController.text.trim().isEmpty)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomInput(
                        label: 'Phone Number',
                        controller: _phoneController,
                        showError: _hasErrors && _phoneController.text.trim().isEmpty),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: CustomInput(
                                label: 'Date',
                                controller: _dateController,
                                showError: _hasErrors && _dateController.text.trim().isEmpty)),
                        const SizedBox(width: 10),
                        Expanded(
                            child: CustomInput(
                                label: 'Time',
                                controller: _timeController,
                                showError: _hasErrors && _timeController.text.trim().isEmpty)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SectionTitle('Vehicle Information'),
                    CustomInput(
                        label: 'License Plate',
                        controller: _plateController,
                        showError: _hasErrors && _plateController.text.trim().isEmpty),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (_validateFields()) {
                          Navigator.pushNamed(context, '/confirmation');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C5E4),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              shadows: [
                                Shadow(offset: Offset(1, 1), blurRadius: 2)
                              ]))),
                  const SizedBox(height: 20),
                  const SectionTitle('Customer Information'),
                  Row(children: [
                    Expanded(child: CustomInput(controller: _first, label: 'First Name')),
                    const SizedBox(width: 10),
                    Expanded(child: CustomInput(controller: _last, label: 'Last Name')),
                  ]),
                  const SizedBox(height: 10),
                  CustomInput(controller: _phone, label: 'Phone Number'),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(child: CustomInput(controller: _date, label: 'Date')),
                    const SizedBox(width: 10),
                    Expanded(child: CustomInput(controller: _time, label: 'Time')),
                  ]),
                  const SizedBox(height: 20),
                  const SectionTitle('Vehicle Information'),
                  CustomInput(controller: _plate, label: 'License Plate'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: _actionBtn('Cancel Booking', Colors.red),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      booking
                        ..firstName = _first.text
                        ..lastName = _last.text
                        ..phone = _phone.text
                        ..plate = _plate.text
                        ..date = _date.text
                        ..time = _time.text;

                      Navigator.pushNamed(context, '/confirmation', arguments: booking);
                    },
                    child: _actionBtn('Confirm', const Color(0xFF26C5E4)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionBtn(String t, Color c) => Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(2, 4))
        ]),
    child: Center(
        child: Text(t,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold))),
  );
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white));
}

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool showError;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    this.showError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: showError
                  ? const Color.fromARGB(30, 255, 255, 255)
                  : const Color.fromARGB(60, 255, 255, 255),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              errorText: showError ? 'This field is required' : null,
              errorStyle: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
