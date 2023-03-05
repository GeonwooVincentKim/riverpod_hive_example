import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/widget/alert_dialog/item_spacing/item_spacing.dart';
import 'package:flutter_todo_list/widget/custom/custom_row.dart';
import 'package:flutter_todo_list/widget/form_Field/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomMaterialAlertDialogModify extends StatefulWidget {
  final Todo getTodo;

  const CustomMaterialAlertDialogModify({
    super.key,
    required this.getTodo
  });

  @override
  State<CustomMaterialAlertDialogModify> createState() => _CustomMaterialAlertDialogModifyState();
}

class _CustomMaterialAlertDialogModifyState extends State<CustomMaterialAlertDialogModify> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController contentsInput = TextEditingController();

  bool _isChecked = false;
  
  final _formKey = GlobalKey<FormState>();
  Todo newInstanceTodo = Todo(id: '', title: '', contents: '', date: '', isDone: false);

  @override
  void initState() {
    setState(() {
      newInstanceTodo = Todo(id: widget.getTodo.id, title: titleInput.text, contents: contentsInput.text, date: dateInput.text, isDone: false);
      // dateInput.text = "";
      // titleInput.text = "";
      // contentsInput.text = "";
      dateInput = TextEditingController(text: widget.getTodo.date);
      titleInput = TextEditingController(text: widget.getTodo.title);
      contentsInput = TextEditingController(text: widget.getTodo.contents);
    });
    
    print("Get Widget ID -> ${widget.getTodo.id}");

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                  child: _buildCheckbox()
                ),
                                  
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
      hintText: widget.getTodo.date,
      onSaved: (val) {
        // newTodo['date'] = val;
        newInstanceTodo.date = val!;
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
        // newTodo['title'] = val;
        newInstanceTodo.title = val!;
      },
      hintText: widget.getTodo.title,
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
        // newTodo['contents'] = val;
        newInstanceTodo.contents = val!;
      },
      hintText: widget.getTodo.contents,
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
          // newTodo['isDone'] = _isChecked;
          newInstanceTodo.isDone = _isChecked;
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
    Provider.of<TodoRiverPod>(context, listen: false).updateTodo(newInstanceTodo);
    Navigator.pushNamed(context, "/");
  }
}
