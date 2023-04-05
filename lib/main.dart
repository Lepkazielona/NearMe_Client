import 'package:flutter/material.dart';
import 'package:near_me_client/views.dart';

void main() => runApp(const app());

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NM Client Debug",
      theme: ThemeData(useMaterial3: true),
      home: SafeArea(child: const Body()),
    );
  }
}
/*
/////////////////////////////////////////
///////////////////////BODY
///////////////////////////
*/

class Body extends StatefulWidget {
  const Body({super.key});


  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _widgetOptions = <Widget>[
      MapView(),
      LoginView()
    ];

    void _onItemTapped(int index){
      setState(() {
        _selectedIndex = index;
      });
    }
    
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: "map", backgroundColor: Colors.blue),
          const BottomNavigationBarItem(icon: Icon(Icons.login), label: "login", backgroundColor: Colors.amber),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      
    );
  }
}