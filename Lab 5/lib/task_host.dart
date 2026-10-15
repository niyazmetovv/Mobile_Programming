import 'package:flutter/material.dart';

class TaskMenu extends StatelessWidget {
  final String title;
  final List<(String, Widget Function())> tasks;

  const TaskMenu({super.key, required this.title, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: tasks.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final (name, builder) = tasks[index];
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(name),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TaskHost(builder: builder)),
              );
            },
          );
        },
      ),
    );
  }
}

class TaskHost extends StatefulWidget {
  final Widget Function() builder;

  const TaskHost({super.key, required this.builder});

  @override
  State<TaskHost> createState() => _TaskHostState();
}

class _TaskHostState extends State<TaskHost> {
  late final Widget app = widget.builder();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        app,
        Positioned(
          left: 8,
          bottom: 8,
          child: FloatingActionButton.small(
            heroTag: null,
            tooltip: 'back to tasks',
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.apps),
          ),
        ),
      ],
    );
  }
}
