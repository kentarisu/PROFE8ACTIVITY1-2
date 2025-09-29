import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'views/services_screen.dart';
import 'views/hello_stateless.dart';
import 'views/hello_stateful.dart';
import 'views/platform_demo_screen.dart';

void main() {
  runApp(const EditFrameStudiosApp());
}

class EditFrameStudiosApp extends StatelessWidget {
  const EditFrameStudiosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Frame Studios',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainNavigationScreen(),
      routes: {
        '/hello-stateless': (context) => const HelloStateless(),
        '/hello-stateful': (context) => const HelloStateful(),
        '/platform-demo': (context) => const PlatformDemoScreen(),
      },
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ServicesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Services',
          ),
        ],
      ),
    );
  }
}
