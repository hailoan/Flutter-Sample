import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(color: Colors.blue),
      child: Row(
        children: [
          const IconButton(onPressed: null, icon: Icon(Icons.menu)),
          Expanded(child: Text('Navigation Menu')),
          const IconButton(onPressed: null, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [MyAppBar(), Expanded(child: Text('hello'))],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('leading press');
          },
        ),
        title: const Text('Tutorial Home'),
        actions: [
          IconButton(
              onPressed: () {
                print('press search');
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Text('hello'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('floating button');
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ontab');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.lightGreen[100]),
        child: const Center(
          child: Text('hello'),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _counter = 1;

  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterIncrementor(onPressed: () {
          increaseCounter();
        }),
        SizedBox(
          height: 10,
        ),
        CounterDisplay(counter: _counter)
      ],
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('Increase'));
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $_counter');
  }
}

class Product {
  const Product({required this.name});
  final String name;
}

typedef CartChangeCallback = Function(Product product, bool inCart);

class ShoppingItemList extends StatelessWidget {
  ShoppingItemList({
    required this.product,
    required this.inCart,
    required this.onChangeCart,
  }) : super(key: ObjectKey(product));

  final CartChangeCallback onChangeCart;
  final Product product;
  final bool inCart;

  Color _getColor(BuildContext context) {
    return inCart //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChangeCart(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need
      // to change _shoppingCart inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products
            .map((e) => ShoppingItemList(
                product: e, inCart: true, onChangeCart: _handleCartChanged))
            .toList(),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: Scaffold(
        body: ShoppingList(products: [
          Product(name: 'vay 2 day'),
          Product(name: 'vay hoa nhi'),
          Product(name: 'Quan dang dai')
        ]),
      ),
    ),
  );
}
