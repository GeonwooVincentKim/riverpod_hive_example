import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/complete.dart';
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
        controller: _tabController,
        children: const [
          Home(),
          Complete(),
        ],
      ),
      bottomNavigationBar: IndicatorBottomNavigationBar(tabController: _tabController),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 3.0),
              shape: BoxShape.circle
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0), 
              onTap: () {
                Navigator.pushNamed(context, "/add");
              },
              child: const Icon(
                Icons.add,
                color: Colors.black54,
                size: 50
              ),
            ),
          )
        )
      ),
    );
  }
}
