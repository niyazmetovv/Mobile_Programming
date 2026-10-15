import 'package:flutter/material.dart';
import 'task_host.dart';

class Task1Screen extends StatelessWidget {
  const Task1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskMenu(
      title: 'task 1: navigator push and pop',
      tasks: [
        ('1.1 two screens with push and pop', task11),
        ('1.2 three screen chain', task12),
        ('1.3 replace, do not stack', task13),
        ('1.4 back to the start', task14),
        ('1.5 smart back button', task15),
      ],
    );
  }
}

Widget task11() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T11Home(),
    );

class _T11Home extends StatelessWidget {
  const _T11Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('open details'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const _T11Details()),
            );
          },
        ),
      ),
    );
  }
}

class _T11Details extends StatelessWidget {
  const _T11Details();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('details')),
      body: Center(
        child: ElevatedButton(
          child: const Text('go back'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

Widget task12() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T12Screen(
        'A',
        Colors.orange,
        next: _T12Screen(
          'B',
          Colors.teal,
          next: _T12Screen('C', Colors.purple),
        ),
      ),
    );

class _T12Screen extends StatelessWidget {
  final String letter;
  final Color color;
  final Widget? next;

  const _T12Screen(this.letter, this.color, {this.next});

  @override
  Widget build(BuildContext context) {
    final nextScreen = next;
    return Scaffold(
      appBar: AppBar(title: Text('screen $letter'), backgroundColor: color),
      body: Center(
        child: nextScreen != null
            ? ElevatedButton(
                child: const Text('next'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => nextScreen),
                ),
              )
            : ElevatedButton(
                child: const Text('back'),
                onPressed: () => Navigator.pop(context),
              ),
      ),
    );
  }
}

Widget task13() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T13Login(),
    );

class _T13Login extends StatelessWidget {
  const _T13Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('sign in (pushReplacement)'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const _T13Home()),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              child: const Text('sign in (normal push, to compare)'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const _T13Home()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _T13Home extends StatelessWidget {
  const _T13Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: const Center(child: Text('welcome')),
    );
  }
}

Widget task14() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T14Step(1),
    );

class _T14Step extends StatelessWidget {
  final int step;

  const _T14Step(this.step);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('step $step')),
      body: Center(
        child: step < 4
            ? ElevatedButton(
                child: const Text('next'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => _T14Step(step + 1)),
                ),
              )
            : ElevatedButton(
                child: const Text('finish'),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
              ),
      ),
    );
  }
}

Widget task15() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T15Root(),
    );

class BackOrExitButton extends StatelessWidget {
  const BackOrExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return ElevatedButton(
      onPressed: canPop ? () => Navigator.pop(context) : null,
      child: Text(canPop ? 'back' : 'nothing to go back to'),
    );
  }
}

class _T15Root extends StatelessWidget {
  const _T15Root();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('root screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BackOrExitButton(),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('open pushed screen'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const _T15Pushed()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _T15Pushed extends StatelessWidget {
  const _T15Pushed();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pushed screen')),
      body: const Center(child: BackOrExitButton()),
    );
  }
}
