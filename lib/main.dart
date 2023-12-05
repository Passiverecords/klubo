import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klubo/realm/app_services.dart';
import 'package:klubo/realm/realm_services.dart';
import 'package:klubo/screens/product_list_screen.dart';
import 'package:klubo/screens/welcome_screen.dart';
import 'package:klubo/theme/base_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppServices('memberapp-mfmwm', FirebaseAuth.instance),
      ),
      ChangeNotifierProxyProvider<AppServices, RealmServices?>(
          create: (context) => null,
          update: (BuildContext context, AppServices appServices,
              RealmServices? realmServices) {
            return appServices.app.currentUser != null
                ? RealmServices(
                    appServices.app,
                  )
                : null;
          })
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices?>(context, listen: false);
    final appServices = Provider.of<AppServices>(context, listen: false);
    appServices.auth.setSettings(
        appVerificationDisabledForTesting: true, forceRecaptchaFlow: false);
    return MaterialApp(
      title: 'MCP',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: renderBaseTheme(context),
      initialRoute: realmServices?.app.currentUser == null ? '/welcome' : '/',
      routes: {
        '/': (context) => const ProductListScreen(),
        '/welcome': (context) => const WelcomeScreen()
      },
    );
  }
}
