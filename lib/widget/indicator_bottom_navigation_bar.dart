import 'package:flutter/material.dart';
import 'package:flutter_todo_list/shared/style.dart';

class IndicatorBottomNavigationBar extends StatelessWidget {
  final TabController _tabController;  
  const IndicatorBottomNavigationBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        indicator: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.blue,
              width: 3,
            ),
          )
        ),
        tabs: const [
          Text("미완료"),
          Text("완료")
        ],
        labelColor: black,
      )
    );
  }
}
