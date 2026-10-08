import 'package:flutter/material.dart';
import 'task1_screen.dart';
import 'task2_screen.dart';
import 'task3_screen.dart';
import 'task4_screen.dart';
import 'task5_screen.dart';
import 'task6_screen.dart';
import 'task7_screen.dart';
import 'task8_screen.dart';
import 'task9_screen.dart';
import 'task10_screen.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Flutter Mobile Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Lab4HomeScreen(),
    );
  }
}

class Lab4HomeScreen extends StatelessWidget {
  const Lab4HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {
        'number': '1',
        'title': 'task 1: selection controls',
        'subtitle': 'switch and checkbox list tiles',
        'screen': const Task1Screen(),
      },
      {
        'number': '2',
        'title': 'task 2: input fields',
        'subtitle': 'login form and email validation',
        'screen': const Task2Screen(),
      },
      {
        'number': '3',
        'title': 'task 3: buttons and action items',
        'subtitle': 'floatingactionbutton and counter reset',
        'screen': const Task3Screen(),
      },
      {
        'number': '4',
        'title': 'task 4: indicators and feedback',
        'subtitle': 'progress indicator and snackbar undo',
        'screen': const Task4Screen(),
      },
      {
        'number': '5',
        'title': 'task 5: dialogs and modals',
        'subtitle': 'alert dialog and bottom sheet options',
        'screen': const Task5Screen(),
      },
      {
        'number': '6',
        'title': 'task 6: sliders and pickers',
        'subtitle': 'volume slider and date picker',
        'screen': const Task6Screen(),
      },
      {
        'number': '7',
        'title': 'task 7: scrollable collections',
        'subtitle': 'lazy listview and swipe to dismiss',
        'screen': const Task7Screen(),
      },
      {
        'number': '8',
        'title': 'task 8: grid displays',
        'subtitle': '2-column grid and image preview',
        'screen': const Task8Screen(),
      },
      {
        'number': '9',
        'title': 'task 9: navigation controls',
        'subtitle': 'bottom navigation bar and top tab bar',
        'screen': const Task9Screen(),
      },
      {
        'number': '10',
        'title': 'task 10: structural containers',
        'subtitle': 'card container and faq expansion tiles',
        'screen': const Task10Screen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('lab 4: flutter mobile widgets'),
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
