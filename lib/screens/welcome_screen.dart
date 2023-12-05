import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klubo/layouts/base_layout.dart';
import 'package:klubo/main.dart';
import 'package:klubo/screens/auth/login_screen.dart';
import 'package:klubo/screens/product_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  String? _verificationId;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text(
            'Connexion',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ]);
  }

  void _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+33${_phoneController.text}',
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          _verificationId = verificationId;
        });
        Navigator.pop(context);
        _phoneController.clear();
        _showBottomSheet(context);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {
        print(error);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _codeController,
                    decoration: const InputDecoration(
                        hintText: 'XX XX XX', label: Text('Code SMS')),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: FilledButton(
                    onPressed: _signInWithPhoneNumber,
                    child: const Text('Verifier le code'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showPhoneInputBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                        hintText: '06 XX XX XX XX',
                        label: Text('Numéro de telephone')),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: FilledButton(
                    onPressed: () {
                      _verifyPhoneNumber();
                    },
                    child: const Text('Verify Phone Number'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _signInWithPhoneNumber() async {
    final appServices = Provider.of(context, listen: false);
    final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: _codeController.text);

    try {
      await _auth.signInWithCredential(credential);
      var user = _auth.currentUser;
      Navigator.pop(context);
      if (user != null) {
        var jwt = await user.getIdToken(true);
        var credentials = Credentials.jwt(jwt!);
        appServices.app.logIn(credentials);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductListScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
