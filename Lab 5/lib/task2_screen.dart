import 'package:flutter/material.dart';
import 'task_host.dart';

class Task2Screen extends StatelessWidget {
  const Task2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskMenu(
      title: 'task 2: named routes',
      tasks: [
        ('2.1 route table and pushNamed', task21),
        ('2.2 menu with four routes', task22),
        ('2.3 page not found', task23),
        ('2.4 drawer navigation', task24),
        ('2.5 log out', task25),
      ],
    );
  }
}

class AppRoutes {
  static const home = '/';
  static const settings = '/settings';
}

Widget task21() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const _T21Home(),
        AppRoutes.settings: (context) => const _T21Settings(),
      },
    );

class _T21Home extends StatelessWidget {
  const _T21Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('settings'),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
        ),
      ),
    );
  }
}

class _T21Settings extends StatelessWidget {
  const _T21Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      body: Center(
        child: ElevatedButton(
          child: const Text('back'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

Widget task22() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _T22Home(),
        '/profile': (context) => const _InfoScreen('profile'),
        '/messages': (context) => const _InfoScreen('messages'),
        '/about': (context) => const _InfoScreen('about'),
      },
    );

class _T22Home extends StatelessWidget {
  const _T22Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('profile'),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('messages'),
            onTap: () => Navigator.pushNamed(context, '/messages'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('about'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}

class _InfoScreen extends StatelessWidget {
  final String title;

  const _InfoScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 28))),
    );
  }
}

Widget task23() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _T23Home(),
        '/about': (context) => const _InfoScreen('about'),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (c) => const _NotFoundScreen()),
    );

class _T23Home extends StatelessWidget {
  const _T23Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('about (exists)'),
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('open missing page'),
              onPressed: () => Navigator.pushNamed(context, '/does-not-exist'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('page not found', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('back'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget task24() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _T24Section('home'),
        '/profile': (context) => const _T24Section('profile'),
        '/messages': (context) => const _T24Section('messages'),
        '/about': (context) => const _T24Section('about'),
      },
    );

class _T24Drawer extends StatelessWidget {
  const _T24Drawer();

  static const items = {
    'home': '/',
    'profile': '/profile',
    'messages': '/messages',
    'about': '/about',
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('menu', style: TextStyle(fontSize: 24)),
          ),
          for (final entry in items.entries)
            ListTile(
              title: Text(entry.key),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, entry.value);
              },
            ),
        ],
      ),
    );
  }
}

class _T24Section extends StatelessWidget {
  final String title;

  const _T24Section(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const _T24Drawer(),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 28))),
    );
  }
}

Widget task25() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const _T25Login(),
        '/home': (context) => const _T25Home(),
        '/profile': (context) => const _T25Profile(),
      },
    );

class _T25Login extends StatelessWidget {
  const _T25Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('sign in'),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
    );
  }
}

class _T25Home extends StatelessWidget {
  const _T25Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('open profile'),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
      ),
    );
  }
}

class _T25Profile extends StatelessWidget {
  const _T25Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('profile')),
      body: Center(
        child: ElevatedButton(
          child: const Text('log out'),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          ),
        ),
      ),
    );
  }
}
