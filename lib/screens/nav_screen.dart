import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_tracker/screens/doctor_page.dart';
import 'package:mental_health_tracker/screens/result.dart';
import 'package:provider/provider.dart';

import '../provider/google_signing_provider.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DoctorPage(),
    ResultPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    // final count = ModalRoute.of(context)!.settings.arguments as int;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home), label:'Doctor',),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'MyProfile'),
          ],
          elevation: 0.0,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent.shade200,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
      ),
    );
  }
}
