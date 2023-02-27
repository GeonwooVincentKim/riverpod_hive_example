import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelTitleText;
  final TextEditingController controller;
  final String labelText;
  final VoidCallback onTap;
  final Function(String?) onSaved;
  final String? Function(String?) validator;

  const CustomTextFormField({
    super.key, 
    required this.labelTitleText,
    required this.controller, 
    required this.labelText, 
    required this.onTap,
    required this.onSaved,
    required this.validator
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
              border: const OutlineInputBorder()
            ),
            onTap: onTap,
            onSaved: onSaved,
            validator: validator,
          )
        )
      ],
    );
  }
}
