import 'package:flutter/material.dart';
import 'task_host.dart';

class Task3Screen extends StatelessWidget {
  const Task3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskMenu(
      title: 'task 3: constructor arguments',
      tasks: [
        ('3.1 product list to product details', task31),
        ('3.2 greeting', task32),
        ('3.3 contact card', task33),
        ('3.4 pick a colour', task34),
        ('3.5 edit a counter', task35),
      ],
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

Widget task31() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T31List(),
    );

class _T31List extends StatelessWidget {
  const _T31List();

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _T31Product(product: p),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _T31Product extends StatelessWidget {
  final Product product;
  const _T31Product({required this.product});

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

Widget task32() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T32Name(),
    );

class _T32Name extends StatefulWidget {
  const _T32Name();

  @override
  State<_T32Name> createState() => _T32NameState();
}

class _T32NameState extends State<_T32Name> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('your name')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('greet'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _T32Greeting(name: controller.text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _T32Greeting extends StatelessWidget {
  final String name;

  const _T32Greeting({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('greeting')),
      body: Center(
        child: Text('Hello, $name!', style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phone;
  final String email;
  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Alisher Karimov', '+998 90 111 22 33', 'alisher@example.com'),
  Contact('Dilnoza Yusupova', '+998 91 222 33 44', 'dilnoza@example.com'),
  Contact('Bobur Tursunov', '+998 93 333 44 55', 'bobur@example.com'),
  Contact('Malika Rakhimova', '+998 94 444 55 66', 'malika@example.com'),
  Contact('Sardor Aliyev', '+998 95 555 66 77', 'sardor@example.com'),
];

Widget task33() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T33List(),
    );

class _T33List extends StatelessWidget {
  const _T33List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('contacts')),
      body: ListView(
        children: [
          for (final c in contacts)
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(c.name),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => _T33Card(contact: c)),
              ),
            ),
        ],
      ),
    );
  }
}

class _T33Card extends StatelessWidget {
  final Contact contact;

  const _T33Card({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('name'),
                subtitle: Text(contact.name),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('phone'),
                subtitle: Text(contact.phone),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('email'),
                subtitle: Text(contact.email),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget task34() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T34Square(),
    );

class _T34Square extends StatefulWidget {
  const _T34Square();

  @override
  State<_T34Square> createState() => _T34SquareState();
}

class _T34SquareState extends State<_T34Square> {
  Color color = Colors.grey;

  Future<void> choose() async {
    final picked = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (_) => const _T34Picker()),
    );
    if (!mounted) return;
    if (picked != null) {
      setState(() => color = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('current colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 150, height: 150, color: color),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: choose,
              child: const Text('choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class _T34Picker extends StatelessWidget {
  const _T34Picker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pick a colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final c in const [Colors.red, Colors.green, Colors.blue])
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c,
                    minimumSize: const Size(160, 48),
                  ),
                  onPressed: () => Navigator.pop(context, c),
                  child: const SizedBox.shrink(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget task35() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _T35Counter(),
    );

class _T35Counter extends StatefulWidget {
  const _T35Counter();

  @override
  State<_T35Counter> createState() => _T35CounterState();
}

class _T35CounterState extends State<_T35Counter> {
  int value = 0;

  Future<void> edit() async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (_) => _T35Editor(initial: value)),
    );
    if (!mounted) return;
    if (result != null) {
      setState(() => value = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('stored value: $value', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: edit, child: const Text('edit')),
          ],
        ),
      ),
    );
  }
}

class _T35Editor extends StatefulWidget {
  final int initial;

  const _T35Editor({required this.initial});

  @override
  State<_T35Editor> createState() => _T35EditorState();
}

class _T35EditorState extends State<_T35Editor> {
  late int value = widget.initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('editor')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$value', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton.filled(
                  onPressed: () => setState(() => value--),
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: () => setState(() => value++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, value),
              child: const Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}
