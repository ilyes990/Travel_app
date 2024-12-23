import 'package:flutter/material.dart';

import '../widgets/build_grid_view.dart';
import '../widgets/build_sectionTitle.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SectionTitle(title: 'Experience Section'),
          Expanded(child: BuildGridView()),
        ],
      ),
    );
  }
}
