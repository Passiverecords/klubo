import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klubo/layouts/base_layout.dart';
import 'package:klubo/screens/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final FirebaseAuth _auth;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                    hintText: '06 XX XX XX XX', label: Text('Ton numéro')),
              ),
            ),
            FilledButton(
              onPressed: () {
                _verifyPhoneNumber();
              },
              child: const Text(
                'Connexion',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      )
    ]);
  }

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+33${_phoneController.text}',
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  void _verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
    // Handle verification completion
  }

  void _verificationFailed(FirebaseAuthException error) {
    // Handle verification failure
    print(error);
  }

  Future<void> _codeSent(String verificationId, int? resendToken) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpAuthScreen(verificationId: verificationId),
      ),
    );
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    // Handle auto retrieval timeout
  }
}
