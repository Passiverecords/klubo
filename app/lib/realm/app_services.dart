import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:realm/realm.dart' as realm;

class AppServices with ChangeNotifier {
  String id;
  realm.App app;
  realm.User? currentUser;
  firebase_auth.FirebaseAuth auth;

  AppServices(this.id, this.auth) : app = realm.App(realm.AppConfiguration(id));
  Future<realm.User> loginWithCustomJWT() async {
    String? jwtCode = await auth.currentUser?.getIdToken(true);
    realm.User loggedInUser = await app.logIn(realm.Credentials.jwt(jwtCode!));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  void updateFirebaseUser(realm.User? currentUser) async {
    this.currentUser = currentUser;
    notifyListeners(); // if RealmServices is a ChangeNotifier
  }
}
