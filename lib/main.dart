import 'package:flutter/material.dart';
import 'package:myapp2/about.dart';
import 'package:myapp2/contact.dart';
import 'package:myapp2/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue)
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  //This list is for collect the pages
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AboutPage(),
    ContactPage()

  ];
  //Initial title for appbar
  String appbartitle="Home";

  //change the index and appbar name in set state
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        appbartitle="Home";
      }
      else if(_selectedIndex==1){
        appbartitle="About";
      }
      else if(_selectedIndex==2){
        appbartitle="Contact";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbartitle)),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              selectedTileColor: Colors.grey[100],
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
            ),
            ListTile(
              selectedTileColor: Colors.grey[100],
              title: const Text('About'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
              leading: Icon(Icons.help),
            ),
            ListTile(
              selectedTileColor: Colors.grey[100],
              title: const Text('Contact'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
              leading: Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}