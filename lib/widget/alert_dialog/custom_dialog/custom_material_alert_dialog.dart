import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/widget/alert_dialog/item_spacing/item_spacing.dart';
import 'package:flutter_todo_list/widget/custom/custom_row.dart';
import 'package:flutter_todo_list/widget/form_Field/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    dateInput.text = "";
    titleInput.text = "";
    contentsInput.text = "";

    setState(() {
      // print(todoItem);
      // todoItem = Provider.of<TodoRiverPod>(context, listen: false).selectedTodo!;
      // items = Provider.of<TodoRiverPod>(context, listen: false).todo;
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

                widget.isAdd == true ? 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                    child: _buildCheckbox()
                  ) : Container(),
                                  
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
      onSaved: (val) {
        newTodo['date'] = val;
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
      },
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "제목은 필수로 입력하셔야 합니다";
        }
        return null;
      },
    );
  }

  CustomTextFormField _buildContents() {
    return CustomTextFormField(
      labelTitleText: "내용",
      controller: contentsInput,
      labelText: "내용을 입력하세요",
      onTap: () {},
      onSaved: (val) {
        newTodo['contents'] = val;
      },
      validator: (val) {},
    );
  }

  CheckboxListTile _buildCheckbox() {
    return CheckboxListTile(
      title: const Text("완료여부"),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value!;
          newTodo['isDone'] = _isChecked;
        });
      },
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
    Provider.of<TodoRiverPod>(context, listen: false).createTodo(newTodo);
    Navigator.pushNamed(context, "/");
    // Provider.of<TodoRiverPod>(context, listen: false).addTodo(todoItem);
  }
}
