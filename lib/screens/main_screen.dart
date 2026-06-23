import 'package:flutter/material.dart';
import '../models/student.dart';
import 'pass_screen.dart';
import 'schedule_screen.dart';
import 'login_screen.dart';
import '../main.dart';

class MainScreen extends StatefulWidget {
  final Student student;
  const MainScreen({super.key, required this.student});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'UniPass' : 'Schedule'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'toggle_theme') {
                themeNotifier.value = themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
              } else if (value == 'logout') {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'toggle_theme',
                child: Text(themeNotifier.value == ThemeMode.light
                    ? 'Dark Mode'
                    : 'Light Mode'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          PassScreen(student: widget.student),
          const ScheduleScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pass), label: 'Pass'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
        ],
      ),
    );
  }
}
