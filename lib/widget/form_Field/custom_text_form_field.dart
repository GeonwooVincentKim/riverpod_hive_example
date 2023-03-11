import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelTitleText;
  final TextEditingController controller;
  final String labelText;
  final VoidCallback onTap;
  final Function(String?) onSaved;
  final String? Function(String?) validator;
  final String hintText;
  final bool isEnabled;

  const CustomTextFormField({
    super.key, 
    required this.labelTitleText,
    required this.controller, 
    required this.labelText, 
    required this.onTap,
    required this.onSaved,
    required this.validator,
    required this.hintText,
    required this.isEnabled
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(labelTitleText),
        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(),
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.auto
            ),
            onTap: onTap,
            onSaved: onSaved,
            validator: validator,
            // If User trying to edit data in AlertDialog from Complete Tab,
            // Block user cannot change any value if user doesn't change
            // isComplete value
            // 
            // (if true, still in complete tab and cannot edit data)
            // (otherwise, can modify data and isComplete value)
            enabled: isEnabled == true ? true : false,
          )
        )
      ],
    );
  }
}
