import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_host.dart';

class Task5Screen extends StatelessWidget {
  const Task5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskMenu(
      title: 'task 5: transition animations',
      tasks: [
        ('5.1 fade transition', task51),
        ('5.2 slide from the right', task52),
        ('5.3 slide from the bottom', task53),
        ('5.4 scale and fade together', task54),
        ('5.5 reusable route and global theme', task55),
      ],
    );
  }
}

class _DetailsScreen extends StatelessWidget {
  final String text;

  const _DetailsScreen(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('details')),
      body: Center(child: Text(text)),
    );
  }
}

class _HomeButtons extends StatelessWidget {
  final List<Widget> children;

  const _HomeButtons(this.children);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

Widget task51() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T51Home(),
    );

class _T51Home extends StatelessWidget {
  const _T51Home();

  @override
  Widget build(BuildContext context) {
    return _HomeButtons([
      ElevatedButton(
        child: const Text('open with fade'),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const _DetailsScreen('i faded in'),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        },
      ),
    ]);
  }
}

Widget task52() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T52Home(),
    );

class _T52Home extends StatelessWidget {
  const _T52Home();

  @override
  Widget build(BuildContext context) {
    return _HomeButtons([
      ElevatedButton(
        child: const Text('open with slide from the right'),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const _DetailsScreen('i slid in from the right'),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
      ),
    ]);
  }
}

Widget task53() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T53Home(),
    );

class _T53Home extends StatelessWidget {
  const _T53Home();

  @override
  Widget build(BuildContext context) {
    return _HomeButtons([
      ElevatedButton(
        child: const Text('open with slide from the right'),
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const _DetailsScreen('i slid in from the right'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        ),
      ),
      const SizedBox(height: 12),
      ElevatedButton(
        child: const Text('open as a sheet'),
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const _DetailsScreen('i slid up from the bottom'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final curved = CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              );
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(curved),
                child: child,
              );
            },
          ),
        ),
      ),
    ]);
  }
}

Widget task54() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T54Home(),
    );

class _T54Home extends StatelessWidget {
  const _T54Home();

  @override
  Widget build(BuildContext context) {
    return _HomeButtons([
      ElevatedButton(
        child: const Text('open with scale and fade'),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const _DetailsScreen('i grew and faded in'),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale:
                      Tween<double>(begin: 0.8, end: 1.0).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
            ),
          );
        },
      ),
    ]);
  }
}

class FadeRoute extends PageRouteBuilder<void> {
  FadeRoute(Widget page)
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}

Widget task55() => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
            TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const _T55Home(),
    );

class _T55Home extends StatelessWidget {
  const _T55Home();

  @override
  Widget build(BuildContext context) {
    return _HomeButtons([
      ElevatedButton(
        child: const Text('push with FadeRoute'),
        onPressed: () => Navigator.push(
          context,
          FadeRoute(const _DetailsScreen('custom FadeRoute')),
        ),
      ),
      const SizedBox(height: 12),
      ElevatedButton(
        child: const Text('normal push (theme transition)'),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const _DetailsScreen('cupertino from theme'),
          ),
        ),
      ),
    ]);
  }
}
