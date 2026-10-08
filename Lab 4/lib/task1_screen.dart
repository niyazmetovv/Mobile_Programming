import 'package:flutter/material.dart';

class Task1Screen extends StatefulWidget {
  const Task1Screen({super.key});

  @override
  State<Task1Screen> createState() => _Task1ScreenState();
}

class _Task1ScreenState extends State<Task1Screen> {
  bool isDarkMode = false;
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 1: selection controls'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: const Text('dark mode'),
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text('agree to terms'),
              value: agreedToTerms,
              onChanged: (bool? value) {
                setState(() {
                  agreedToTerms = value ?? false;
                });
              },
            ),
            const SizedBox(height: 10),
            Text(
              agreedToTerms
                  ? 'status: you have agreed to the terms'
                  : 'status: please agree to terms to proceed',
              style: TextStyle(
                color: agreedToTerms ? Colors.green : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: agreedToTerms
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('terms accepted successfully')),
                      );
                    }
                  : null,
              child: const Text('continue'),
            ),
          ],
        ),
      ),
    );
  }
}
