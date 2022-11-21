import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_tracker/provider/google_signing_provider.dart';
import 'package:mental_health_tracker/screens/main_page.dart';
import 'package:mental_health_tracker/utils/utils.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HealthTracker());
}

final navigatorKey = GlobalKey<NavigatorState>();

class HealthTracker extends StatefulWidget {
  const HealthTracker({Key? key}) : super(key: key);

  @override
  State<HealthTracker> createState() => _HealthTrackerState();
}

class _HealthTrackerState extends State<HealthTracker> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
          scaffoldMessengerKey: Utils.messengerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainPage()),
    );
  }
}
