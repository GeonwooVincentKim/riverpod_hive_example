import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/discover.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/widget/indicator_bottom_navigation_bar.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({super.key});

  @override
  State<PageSlider> createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
      body: TabBarView(
        children: [
          Home(),
          Discover(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: IndicatorBottomNavigationBar(tabController: _tabController),
    );
  }
}
