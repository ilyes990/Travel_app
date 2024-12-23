import 'package:flutter/material.dart';

class YesNoQuestion extends StatefulWidget {
  final String question;

  YesNoQuestion({required this.question});

  @override
  _YesNoQuestionState createState() => _YesNoQuestionState();
}

class _YesNoQuestionState extends State<YesNoQuestion> {
  bool? _yesNoValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Yes'),
                leading: Radio<bool>(
                  value: true,
                  groupValue: _yesNoValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _yesNoValue = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text('No'),
                leading: Radio<bool>(
                  value: false,
                  groupValue: _yesNoValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _yesNoValue = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
