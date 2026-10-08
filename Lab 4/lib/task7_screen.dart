import 'package:flutter/material.dart';

class Task7Screen extends StatefulWidget {
  const Task7Screen({super.key});

  @override
  State<Task7Screen> createState() => _Task7ScreenState();
}

class _Task7ScreenState extends State<Task7Screen> {
  final List<String> items = List.generate(20, (index) => 'list item #${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 7: scrollable collections'),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('all items have been dismissed'),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: Key(item),
                  background: Container(
                    color: Colors.red.shade400,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('dismissed $item')),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(item),
                    subtitle: const Text('swipe left or right to remove'),
                    trailing: const Icon(Icons.drag_handle),
                  ),
                );
              },
            ),
    );
  }
}
