import 'package:flutter/material.dart';
import 'package:flutter_todo_list/widget/place_color_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List _children = [
    PlaceholderWidget(color: Colors.white),
    PlaceholderWidget(color: Colors.white),
  ];
  
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO.DO", style: TextStyle(color: Colors.white54)),
      ),
      body: Container(
        child: Text("Testing")
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.amber,
          controller: _tabController,
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.blue,
                width: 3,
              ),
            )
          ),
          tabs: [
            Text("미완료", style: TextStyle(color: Colors.black)),
            Text("완료", style: TextStyle(color: Colors.black))
          ]
        )
      ),
    );
  }

  void _buildOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
