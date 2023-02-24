import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/widget/form_Field/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/state_management/todo_riverpod.dart';

class CustomMaterialAlertDialog extends StatefulWidget {
  final bool isAdd;

  const CustomMaterialAlertDialog({
    super.key,
    required this.isAdd,
  });

  @override
  State<CustomMaterialAlertDialog> createState() => _CustomMaterialAlertDialogState();
}

class _CustomMaterialAlertDialogState extends State<CustomMaterialAlertDialog> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController contentsInput = TextEditingController();
  
  List<Todo> items = [];
  late Todo todoItem;

  @override
  void initState() {
    dateInput.text = "";
    titleInput.text = "";
    contentsInput.text = "";

    setState(() {
      items = Provider.of<TodoRiverPod>(context, listen: false).todo;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Hi")
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelTitleText: "일자",
                      controller: dateInput,
                      labelText: "날짜를 입력하세요",
                      onTap: () async {
                        DateTime? pickedDate = await customDatePicker(context);
                        
                        print(pickedDate);
                        String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate!);
                        print(formattedDate);

                        // todoItem = Todo(
                        //   title: titleInput.text,
                        //   contents: contentsInput.text,
                        //   date: dateInput.text,
                        //   isDone: false
                        // );
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                        // Navigator.of(context).pop();
                        // setState(() {
                        //   dateInput.text = formattedDate;
                        // });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomTextFormField(
                      labelTitleText: "제목",
                      controller: titleInput,
                      labelText: "제목을 입력하세요",
                      onTap: () async {
                        Text(titleInput.text);
                      }
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomTextFormField(
                      labelTitleText: "내용",
                      controller: contentsInput,
                      labelText: "내용을 입력하세요",
                      onTap: () async {
                        if (contentsInput.text == "" || contentsInput.text.isEmpty) {
                          print("No Input");
                        } else {
                          Text(contentsInput.text);
                        }
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );


  }

  Future<DateTime?> customDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101)
    );
  }
}
