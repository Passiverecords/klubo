library mcp_realm;

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:realm/realm.dart';
import 'models/realm_models.dart';

class McpRealmServices with ChangeNotifier {
  late Realm realm;
  Members? _currentUser;
  App app;
  StreamController<Members?> userStreamController =
      StreamController.broadcast();

  Members? get currentUser => _currentUser;

  set user(Members? user) {
    _currentUser = user;
    userStreamController.add(user);
    notifyListeners();
  }

  setRealmSyncUser() async {
    while (_currentUser == null) {
      await Future.delayed(const Duration(seconds: 1));
      Members? firstUser = realm?.all<Members>().first;
      if (firstUser != null) {
        user = firstUser;
        notifyListeners();
      }
    }
  }

  McpRealmServices(this.app) {
    if (app.currentUser != null) {
      var connectedUser = app.currentUser;
      realm = Realm(Configuration.flexibleSync(connectedUser!, [
        Members.schema,
        Invitation.schema,
        Producer.schema,
        ProducerImages.schema,
        ProducerLocations.schema,
        ProducerLocationsGeo.schema,
        ProducerMinimumOrder.schema
      ]));
      updateSubscriptions();
      setRealmSyncUser();
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Members>());
      mutableSubscriptions.add(realm.all<Invitation>());
      mutableSubscriptions.add(realm.all<Producer>());
    });
    await realm.syncSession.waitForDownload();
    await realm.subscriptions.waitForSynchronization();
  }
}
