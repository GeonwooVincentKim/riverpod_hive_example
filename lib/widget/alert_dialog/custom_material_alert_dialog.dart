import 'package:flutter/material.dart';

class CustomMaterialAlertDialog extends StatelessWidget {
  final bool isAdd;

  const CustomMaterialAlertDialog({
    super.key,
    required this.isAdd
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text("Hi", textAlign: TextAlign.center,),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.arrow_back_ios),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //     ),  
            //     // Text("Title"),
            //   ],
            // ),
            Text("Alert Dialog"),
            Text("Alert Dialog"),

            isAdd ? Text("IsAdd") : Text("IsModify")
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
