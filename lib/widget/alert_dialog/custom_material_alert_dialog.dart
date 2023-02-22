import 'package:flutter/material.dart';

class CustomMaterialAlertDialog extends StatelessWidget {
  final bool isAdd;

  const CustomMaterialAlertDialog({
    super.key,
    required this.isAdd
  });

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
                    Row(
                      children: [
                        Text("일자"),
                        TextField(
                          // cont
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
