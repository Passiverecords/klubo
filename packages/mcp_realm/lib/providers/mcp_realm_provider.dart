import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcp_realm/mcp_realm.dart';
import 'package:provider/provider.dart';

class McpRealmProvider {
  final String appId;
  const McpRealmProvider({required this.appId});

  ChangeNotifierProvider<McpAppService> get appProvider {
    return ChangeNotifierProvider(
        create: (_) => McpAppService(appId, FirebaseAuth.instance));
  }

  ChangeNotifierProxyProvider<McpAppService, McpRealmServices?>
      get realmProvider {
    {
      return ChangeNotifierProxyProvider<McpAppService, McpRealmServices?>(
          create: (context) => null,
          update: (BuildContext context, McpAppService appServices,
              McpRealmServices? realmServices) {
            return appServices.app.currentUser != null
                ? McpRealmServices(
                    appServices.app,
                  )
                : null;
          });
    }
  }
}
