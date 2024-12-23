import 'package:flutter/material.dart';

class DropdownQuestion extends StatelessWidget {
  final String question;
  final List<String> options;

  DropdownQuestion({required this.question, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        DropdownButton<String>(
          isExpanded: true,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
