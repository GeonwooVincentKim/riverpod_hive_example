import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/example/dialog/dialog_popup_example.dart';
import 'package:flutter_todo_list/widget/alert_dialog/item_spacing/item_spacing.dart';
import 'package:flutter_todo_list/widget/custom/custom_row.dart';
import 'package:flutter_todo_list/widget/form_Field/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomMaterialAlertDialog extends StatefulWidget {
  const CustomMaterialAlertDialog({
    super.key,
  });

  @override
  State<CustomMaterialAlertDialog> createState() => _CustomMaterialAlertDialogState();
}

class _CustomMaterialAlertDialogState extends State<CustomMaterialAlertDialog> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController contentsInput = TextEditingController();

  bool _isChecked = false;
  
  // List<Todo> items = [];
  // late Todo todoItem;
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newTodo = {
    'title': '',
    'contents': '',
    'date': '',
    'isDone': false
  };

  Todo newInstanceTodo = Todo(id: '', title: '', contents: '', date: '', isDone: false);
  // Todo modifyTodo = 

  @override
  void initState() {
    dateInput.text = "";
    titleInput.text = "";
    contentsInput.text = "";

    setState(() {
      // print(todoItem);
      // todoItem = Provider.of<TodoRiverPod>(context, listen: false).selectedTodo!;
      // items = Provider.of<TodoRiverPod>(context, listen: false).todoList;
    });

    // if (todoItem == null) {
    //   print("passing");
    //   final List<Todo> listTodo = Provider.of<TodoRiverPod>(context, listen: false).todo.toList();
    //   todoItem = listTodo.firstWhere((element) => element.id == widget.)
    // }

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
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Hi")
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                  child: Column(
                    children: [
                      _buildDate(context),
                      const ListItemSpace(),
                      _buildTitle(),
                      const ListItemSpace(),
                      _buildContents(),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                CustomRow(
                  onNoPressed: () => Navigator.of(context).pop(),
                  onOkPressed: () => submit()
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  CustomTextFormField _buildDate(BuildContext context) {
    return CustomTextFormField(
      labelTitleText: "일자",
      controller: dateInput,
      labelText: "날짜를 입력하세요",
      onTap: () async {
        DateTime? pickedDate = await customDatePicker(context);
        String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate!);
        print(formattedDate);

        dateInput.text = formattedDate;
      },
      hintText: "",
      onSaved: (val) {
        newTodo['date'] = val;
        // newInstanceTodo.date = val!;
      },
      validator: (val) {
        return null;
      },
    );
  }

  CustomTextFormField _buildTitle() {
    return CustomTextFormField(
      labelTitleText: "제목",
      controller: titleInput,
      labelText: "제목을 입력하세요",
      onTap: () {},
      onSaved: (val) {
        newTodo['title'] = val;
        // newInstanceTodo.title = val!;
      },
      hintText: "",
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "제목은 필수로 입력하셔야 합니다";
        }
        return null;
      },
    );
  }

  CustomTextFormField _buildContents() {
    print("Get Contents -> ${newInstanceTodo.contents}");

    return CustomTextFormField(
      labelTitleText: "내용",
      controller: contentsInput,
      labelText: "내용을 입력하세요",
      onTap: () {},
      onSaved: (val) {
        newTodo['contents'] = val;
        // newInstanceTodo.contents = val!;
      },
      hintText: "",
      validator: (val) {},
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

  void submit() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    // Provider.of<TodoRiverPod>(context, listen: false).addTodo(newInstanceTodo);
    Provider.of<TodoRiverPod>(context, listen: false).createTodo(newTodo);
    
    Navigator.pop(context);
  }
}
