import 'package:flutter/material.dart';
import 'task_host.dart';

class Task4Screen extends StatelessWidget {
  const Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskMenu(
      title: 'task 4: named route arguments',
      tasks: [
        ('4.1 ScreenArguments class', task41),
        ('4.2 send a number', task42),
        ('4.3 user profile', task43),
        ('4.4 onGenerateRoute', task44),
        ('4.5 result from a named route', task45),
      ],
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;
  const ScreenArguments(this.title, this.message);
}

Widget task41() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _T41Home(),
        '/details': (context) => const _T41Details(),
      },
    );

class _T41Home extends StatelessWidget {
  const _T41Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('send arguments'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: const ScreenArguments('welcome', 'sent from home'),
            );
          },
        ),
      ),
    );
  }
}

class _T41Details extends StatelessWidget {
  const _T41Details();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message)),
    );
  }
}

Widget task42() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _T42Home(),
        '/square': (context) => const _T42Square(),
      },
    );

class _T42Home extends StatelessWidget {
  const _T42Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pick a number')),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final n in [1, 2, 3])
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/square', arguments: n),
                  child: Text('$n'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _T42Square extends StatelessWidget {
  const _T42Square();

  @override
  Widget build(BuildContext context) {
    final n = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(title: const Text('square')),
      body: Center(
        child: Text('$n squared is ${n * n}',
            style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  final String city;
  const User(this.name, this.age, this.city);
}

const users = [
  User('Alisher', 21, 'Tashkent'),
  User('Dilnoza', 24, 'Samarkand'),
  User('Bobur', 19, 'Bukhara'),
  User('Malika', 22, 'Nukus'),
];

class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('users')),
      body: ListView(
        children: [
          for (final u in users)
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(u.name),
              onTap: () =>
                  Navigator.pushNamed(context, '/profile', arguments: u),
            ),
        ],
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  final User user;

  const _ProfileBody(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        children: [
          ListTile(title: const Text('name'), subtitle: Text(user.name)),
          ListTile(title: const Text('age'), subtitle: Text('${user.age}')),
          ListTile(title: const Text('city'), subtitle: Text(user.city)),
        ],
      ),
    );
  }
}

Widget task43() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _UserList(),
        '/profile': (context) => const _T43Profile(),
      },
    );

class _T43Profile extends StatelessWidget {
  const _T43Profile();

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return _ProfileBody(user);
  }
}

Widget task44() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => const _UserList(),
          );
        }
        if (settings.name == '/profile') {
          final user = settings.arguments;
          if (user is User) {
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => _ProfileBody(user),
            );
          }
        }
        return null;
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('unknown route'))),
      ),
    );

Widget task45() => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _T45Home(),
        '/rate': (context) => const _T45Rate(),
      },
    );

class _T45Home extends StatefulWidget {
  const _T45Home();

  @override
  State<_T45Home> createState() => _T45HomeState();
}

class _T45HomeState extends State<_T45Home> {
  static const movie = 'Inception';
  int? rating;

  Future<void> rate() async {
    final result = await Navigator.pushNamed<int>(
      context,
      '/rate',
      arguments: movie,
    );
    if (!mounted) return;
    if (result != null) {
      setState(() => rating = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('movies')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rating == null ? '$movie: not rated yet' : '$movie: $rating/5',
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: rate, child: const Text('rate')),
          ],
        ),
      ),
    );
  }
}

class _T45Rate extends StatelessWidget {
  const _T45Rate();

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('rate $title')),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var star = 1; star <= 5; star++)
              IconButton(
                iconSize: 40,
                icon: const Icon(Icons.star, color: Colors.amber),
                tooltip: '$star',
                onPressed: () => Navigator.pop(context, star),
              ),
          ],
        ),
      ),
    );
  }
}
