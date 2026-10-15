import 'package:flutter/material.dart';
import 'task1_screen.dart';
import 'task2_screen.dart';
import 'task3_screen.dart';
import 'task4_screen.dart';
import 'task5_screen.dart';
import 'task6_screen.dart';

void main() {
  runApp(const Lab5App());
}

class Lab5App extends StatelessWidget {
  const Lab5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 - Navigation and Routing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Lab5HomeScreen(),
    );
  }
}

class Lab5HomeScreen extends StatelessWidget {
  const Lab5HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {
        'number': '1',
        'title': 'task 1: navigator push and pop',
        'subtitle': 'push, pop, pushReplacement, popUntil',
        'screen': const Task1Screen(),
      },
      {
        'number': '2',
        'title': 'task 2: named routes',
        'subtitle': 'route table, 404 page, drawer, log out',
        'screen': const Task2Screen(),
      },
      {
        'number': '3',
        'title': 'task 3: constructor arguments',
        'subtitle': 'passing data forward and returning results',
        'screen': const Task3Screen(),
      },
      {
        'number': '4',
        'title': 'task 4: named route arguments',
        'subtitle': 'arguments, onGenerateRoute, results',
        'screen': const Task4Screen(),
      },
      {
        'number': '5',
        'title': 'task 5: transition animations',
        'subtitle': 'fade, slide, scale, FadeRoute, theme',
        'screen': const Task5Screen(),
      },
      {
        'number': '6',
        'title': 'task 6: go_router',
        'subtitle': 'go, push, path parameters, extra, transitions',
        'screen': const Task6Screen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('lab 5: navigation and routing'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: tasks.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = tasks[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(item['number'] as String),
            ),
            title: Text(item['title'] as String),
            subtitle: Text(item['subtitle'] as String),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => item['screen'] as Widget,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
