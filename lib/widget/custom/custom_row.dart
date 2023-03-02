import 'package:flutter/material.dart';
import 'package:flutter_todo_list/widget/custom/button/custom_elevated_button.dart';

class CustomRow extends StatelessWidget {
  final VoidCallback onNoPressed;
  final VoidCallback onOkPressed;

  const CustomRow({
    super.key,
    required this.onNoPressed,
    required this.onOkPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomElevatedButton(buttonText: "Cancel", onPressed: onNoPressed),
        CustomElevatedButton(buttonText: "Save", onPressed: onOkPressed),
      ],
    );
  }
}
