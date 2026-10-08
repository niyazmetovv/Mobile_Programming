import 'package:flutter/material.dart';

class Task10Screen extends StatelessWidget {
  const Task10Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 10: structural containers'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.school, size: 40),
              title: Text('mobile programming'),
              subtitle: Text('course code: se202'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          SizedBox(height: 20),
          ExpansionTile(
            leading: Icon(Icons.help),
            title: Text('what is a widget?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('everything in flutter ui is a widget, from buttons to layout containers.'),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.help),
            title: Text('what is setstate?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('setstate tells flutter that data changed and to redraw the screen.'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
