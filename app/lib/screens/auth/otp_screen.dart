import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:klubo/layouts/base_layout.dart';
import 'package:mcp/mcp.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart' as realm;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../main.dart';
import '../product_list_screen.dart';
import 'widget/user_input_form.dart';

class OtpAuthScreen extends StatefulWidget {
  final String verificationId;
  const OtpAuthScreen({super.key, required this.verificationId});

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController _codeController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseLayout(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: OtpTextField(
              numberOfFields: 6,
              borderColor: const Color.fromRGBO(237, 105, 90, 1),
              focusedBorderColor: const Color.fromRGBO(237, 105, 90, 1),
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                setState(() {
                  _codeController.text = verificationCode;
                });
                _signInWithPhoneNumber();
              }, // end onSubmit
            ),
          ),
        ]),
      ],
    );
  }

  Future<void> _signInWithPhoneNumber() async {
    final appServices = Provider.of<McpAppService>(context, listen: false);
    final credential = firebase_auth.PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: _codeController.text);
    LoadingHelper.show();
    var firebaseUser = await _logInFirebase(credential);
    if (firebaseUser != null) {
      final jwt = await firebaseUser.getIdToken(true);
      final credentials = realm.Credentials.jwt(jwt!);
      try {
        var user = await appServices?.app.logIn(credentials);
        if (user != null) {
          appServices.updateFirebaseUser(user);
          McpRealmServices? realmService;
          while (realmService == null) {
            await Future.delayed(const Duration(seconds: 1));
            realmService =
                Provider.of<McpRealmServices?>(context, listen: false);
            if (realmService != null) {
              await Future.delayed(const Duration(seconds: 2));
              await realmService.setRealmSyncUser();
              if (realmService.currentUser != null) {
                if (!realmService.currentUser!.acceptedCGU &&
                    realmService.currentUser!.name != "") {
                  LoadingHelper.hide();
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: false,
                      builder: (context) => UserInputForm(
                          realmService: realmService,
                          member: realmService!.currentUser!));
                } else {
                  LoadingHelper.hide();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductListScreen()),
                  );
                }
              }
            }
          }
        }
      } catch (e) {
        print('Login Error: $e');
      }
    }
  }

  // Handling Firebase login separately
  Future<firebase_auth.User?> _logInFirebase(
      firebase_auth.PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
      return _auth.currentUser;
    } on firebase_auth.FirebaseAuthException catch (e) {
      return null;
    }
  }
}

class LoadingHelper {
  static late OverlayEntry _loadingOverlayEntry;

  static void show() {
    _loadingOverlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        child: Container(
          color: Colors.black.withOpacity(0.5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(237, 105, 90, 1),
            ),
          ),
        ),
      ),
    );
    navigatorKey.currentState!.overlay!.insert(_loadingOverlayEntry);
  }

  static void hide() {
    _loadingOverlayEntry.remove();
  }
}
