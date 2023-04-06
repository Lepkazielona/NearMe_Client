import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:near_me_client/bottom_panel_views/map.dart';
import 'package:near_me_client/bottom_panel_views/login_debug.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
//void main() => runApp(app());

FirebaseDatabase database = FirebaseDatabase.instance;
bool isDarkMode = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NM Client Debug",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Colors.black,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.black,
            onBackground: Colors.black,
            surface: Colors.black,
            onSurface: Colors.white),
      ),
      home: const SafeArea(child: Body()),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    MapView(brightness: isDarkMode),
    const LoginViewDebug(),
  ];

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: "Mapa",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: "login",
                backgroundColor: Colors.amber),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: _onItemTapped,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ) //screens[_selectedIndex],
        );
  }
}
