import 'package:flutter/material.dart';

class Task9Screen extends StatefulWidget {
  const Task9Screen({super.key});

  @override
  State<Task9Screen> createState() => _Task9ScreenState();
}

class _Task9ScreenState extends State<Task9Screen> {
  int _selectedBottomIndex = 0;

  final List<Widget> _bottomPages = const [
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 60, color: Colors.blue),
          SizedBox(height: 12),
          Text('home feed view', style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 60, color: Colors.green),
          SizedBox(height: 12),
          Text('search explorer view', style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 60, color: Colors.orange),
          SizedBox(height: 12),
          Text('user profile view', style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('task 9: navigation controls'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.explore), text: 'explore'),
              Tab(icon: Icon(Icons.favorite), text: 'saved'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _bottomPages[_selectedBottomIndex],
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 60, color: Colors.red),
                  SizedBox(height: 12),
                  Text('saved bookmarks tab', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedBottomIndex,
          onTap: (index) {
            setState(() {
              _selectedBottomIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}
