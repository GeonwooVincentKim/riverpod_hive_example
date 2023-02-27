import 'package:flutter/material.dart';

class RenderTextFormField extends StatelessWidget {
  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

  const RenderTextFormField({
    super.key, 
    required this.label, 
    required this.onSaved, 
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
        ),
        Container(height: 16.0),
      ],
    );
  }
}