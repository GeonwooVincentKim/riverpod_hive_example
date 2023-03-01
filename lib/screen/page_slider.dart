import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/screen/complete.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/widget/alert_dialog/custom_alert_dialog.dart';
import 'package:flutter_todo_list/widget/alert_dialog/custom_material_alert_dialog.dart';
import 'package:flutter_todo_list/widget/indicator_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({super.key});

  @override
  State<PageSlider> createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // List<Todo> items = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    
    // setState(() {
    //   items = Provider.of<TodoRiverPod>(context, listen: false).todo;
    // });
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomMaterialAlertDialog(isAdd: true);
                  }
                );
                
                // if(todoItem != null) {
                //   setState(() {
                //     items.add(todoItem);
                //   });
                // }
                // showDialog(context: context, builder: (BuildContext context) {
                //   return AlertDialog(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)
                //     ),
                //     title: Column(
                //       children: [

                //       ],
                //     )
                //   );
                // });
                // CustomAlertDialog(title: Text("Test"), content: Text("Content"), actions: []);

                // Navigator.pushNamed(context, "/add");
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
