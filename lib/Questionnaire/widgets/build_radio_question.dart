import 'package:flutter/material.dart';

class RadioQuestion extends StatefulWidget {
  final String question;
  final List<String> options;

  RadioQuestion({required this.question, required this.options});

  @override
  // ignore: library_private_types_in_public_api
  _RadioQuestionState createState() => _RadioQuestionState();
}

class _RadioQuestionState extends State<RadioQuestion> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question),
        Column(
          children: widget.options.map((String value) {
            return ListTile(
              title: Text(value),
              leading: Radio<String>(
                value: value,
                groupValue: _selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
