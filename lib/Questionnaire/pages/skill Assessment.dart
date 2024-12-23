import 'package:flutter/material.dart';

class SkillAssessment extends StatefulWidget {
  const SkillAssessment({super.key});

  @override
  _SkillAssessmentState createState() => _SkillAssessmentState();
}

class _SkillAssessmentState extends State<SkillAssessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skill Assessment'),
      ),
      body: Center(
        child: Text('Skill Assessment Page'),
      ),
    );
  }
}
