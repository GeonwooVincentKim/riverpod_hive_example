import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MyListPage(),
        "/selectedItem": (context) => MySelectedItemsPage(selectedItems: _selectedItems),
      },
    );
  }
}

List<String> _items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];

List<String> _selectedItems = [];

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {


  void _onItemChecked(bool value, String item) {
    if (value) {
      setState(() {
        _selectedItems.add(item);
        _items.remove(item);
      });
    } else {
      setState(() {
        _selectedItems.remove(item);
        _items.add(item);
      });
    }
  }

  void _onSubmit() {
    Navigator.pushNamed(context, "/selectedItem");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => MySelectedItemsPage(selectedItems: _selectedItems),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List Page'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return CheckboxListTile(
            title: Text(item),
            value: _selectedItems.contains(item),
            onChanged: (value) => _onItemChecked(value!, item),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedItems.isNotEmpty ? _onSubmit : null,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class MySelectedItemsPage extends StatefulWidget {
  final List<String> selectedItems;

  const MySelectedItemsPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  State<MySelectedItemsPage> createState() => _MySelectedItemsPageState();
}

class _MySelectedItemsPageState extends State<MySelectedItemsPage> {
  void _onItemChecked(bool value, String item) {
    if (value) {
      setState(() {
        _selectedItems.add(item);
        _items.remove(item);
      });
    } else {
      setState(() {
        _selectedItems.remove(item);
        _items.add(item);
      });
    }
  }

  void _onSubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MySelectedItemsPage(selectedItems: _selectedItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedItems.length,
        itemBuilder: (context, index) {
          final item = widget.selectedItems[index];
          // return ListTile(
          //   title: Text(item),
          // );
          return CheckboxListTile(
            title: Text(item),
            value: _selectedItems.contains(item),
            onChanged: (value) => _onItemChecked(value!, item),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedItems.isNotEmpty ? _onSubmit : null,
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}