import 'package:flutter/material.dart';

class ListItemSpace extends StatelessWidget {
  const ListItemSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.04);
  }
}
