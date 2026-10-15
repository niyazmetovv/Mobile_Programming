import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'task_host.dart';

class Task6Screen extends StatelessWidget {
  const Task6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskMenu(
      title: 'task 6: go_router',
      tasks: [
        ('6.1 go, push and pop', task61),
        ('6.2 path parameters', task62),
        ('6.3 passing an object with extra', task63),
        ('6.4 named routes and 404 page', task64),
        ('6.5 transition in go_router', task65),
      ],
    );
  }
}

class _SimpleScreen extends StatelessWidget {
  final String title;

  const _SimpleScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('pop'),
        ),
      ),
    );
  }
}

Widget task61() => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const _T61Home(),
          ),
          GoRoute(
            path: '/details',
            builder: (context, state) => const _SimpleScreen('details'),
          ),
        ],
      ),
    );

class _T61Home extends StatelessWidget {
  const _T61Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('go (replace stack)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.push('/details'),
              child: const Text('push (add to stack)'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget task62() => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const _T62Home(),
          ),
          GoRoute(
            path: '/product/:id',
            builder: (context, state) =>
                _T62Product(id: state.pathParameters['id']!),
          ),
        ],
      ),
    );

class _T62Home extends StatelessWidget {
  const _T62Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final id in [1, 2, 3])
              Padding(
                padding: const EdgeInsets.all(6),
                child: ElevatedButton(
                  onPressed: () => context.push('/product/$id'),
                  child: Text('product $id'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _T62Product extends StatelessWidget {
  final String id;

  const _T62Product({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('product')),
      body: Center(
        child: Text('Product #$id', style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  const Product(this.name, this.price);
}

const products = [
  Product('Laptop', 999.0),
  Product('Phone', 599.5),
  Product('Headphones', 79.9),
];

Widget task63() => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const _T63List(),
          ),
          GoRoute(
            path: '/product-details',
            builder: (context, state) =>
                _T63Product(product: state.extra as Product),
          ),
        ],
      ),
    );

class _T63List extends StatelessWidget {
  const _T63List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('products')),
      body: ListView(
        children: [
          for (final p in products)
            ListTile(
              title: Text(p.name),
              subtitle: Text('\$${p.price}'),
              onTap: () => context.push('/product-details', extra: p),
            ),
        ],
      ),
    );
  }
}

class _T63Product extends StatelessWidget {
  final Product product;

  const _T63Product({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Text('price: \$${product.price}',
            style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

Widget task64() => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const _T64Home(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const _T64Simple('settings'),
          ),
          GoRoute(
            path: '/item/:id',
            name: 'item',
            builder: (context, state) =>
                _T64Simple('item #${state.pathParameters['id']}'),
          ),
        ],
        errorBuilder: (context, state) => const _T64Simple('page not found'),
      ),
    );

class _T64Home extends StatelessWidget {
  const _T64Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('settings'),
              child: const Text('settings'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  context.goNamed('item', pathParameters: {'id': '42'}),
              child: const Text('item 42'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/does-not-exist'),
              child: const Text('missing page'),
            ),
          ],
        ),
      ),
    );
  }
}

class _T64Simple extends StatelessWidget {
  final String title;

  const _T64Simple(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed('home'),
          child: const Text('home'),
        ),
      ),
    );
  }
}

CustomTransitionPage<void> buildPage(Widget child, GoRouterState state) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(curved),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}

Widget task65() => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                buildPage(const _T65Home(), state),
          ),
          GoRoute(
            path: '/details',
            pageBuilder: (context, state) =>
                buildPage(const _SimpleScreen('details'), state),
          ),
          GoRoute(
            path: '/about',
            pageBuilder: (context, state) =>
                buildPage(const _SimpleScreen('about'), state),
          ),
        ],
      ),
    );

class _T65Home extends StatelessWidget {
  const _T65Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/details'),
              child: const Text('details'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.push('/about'),
              child: const Text('about'),
            ),
          ],
        ),
      ),
    );
  }
}
