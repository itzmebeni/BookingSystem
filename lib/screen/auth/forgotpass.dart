import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isEmailValid = true;
  String? _emailError;

  // Simple email regex
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF008C9E), Color(0xFF003C4D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'E&C',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const Text(
                  'CARWASH',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70, width: 2),
                  ),
                  child: const Icon(Icons.lock_outline, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Trouble logging in?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter your email and we'll send you a link to get back into your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),

                // Email Input with red border and error message
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _isEmailValid ? Colors.transparent : Colors.red,
                      width: 1.5,
                    ),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _isEmailValid = false;
                          _emailError = 'Email is required';
                        });
                        return '';
                      } else if (!emailRegex.hasMatch(value)) {
                        setState(() {
                          _isEmailValid = false;
                          _emailError = 'Enter a valid email address';
                        });
                        return '';
                      }

                      setState(() {
                        _isEmailValid = true;
                        _emailError = null;
                      });
                      return null;
                    },
                  ),
                ),

                // Show error message below the input
                if (_emailError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _emailError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final email = _emailController.text;

                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Reset Link Sent'),
                            content: Text('A login link has been sent to $email'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Send login link',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white38)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR', style: TextStyle(color: Colors.white70)),
                    ),
                    Expanded(child: Divider(color: Colors.white38)),
                  ],
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Create new account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to login',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
