import 'package:flutter/material.dart';
import 'package:travel_app/features/adventure_details/data/adventure_repo_implmnt.dart';
import 'package:travel_app/features/adventure_details/presentation/adventure_details_view.dart';

class AdventureFormPage extends StatefulWidget {
  final AdventureRepositoryImpl geminiService;

  const AdventureFormPage({super.key, required this.geminiService});
  @override
  _AdventureFormPageState createState() => _AdventureFormPageState();
}

class _AdventureFormPageState extends State<AdventureFormPage> {
  final _typeController = TextEditingController();
  final _membersController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _distanceController = TextEditingController();
  final _challengeController = TextEditingController();
  final _weatherController = TextEditingController();

  String generatedItems = '';

  // void generateItems() {
  //   widget.geminiService
  //       .getAdventureItems(
  //     // type: _typeController.text,
  //     // members: int.parse(_membersController.text),
  //     // difficulty: _difficultyController.text,
  //     // distance: _distanceController.text,
  //     // challenge: _challengeController.text,
  //     // weather: _weatherController.text,
  //     type: 'hiking',
  //     members: 4,
  //     difficulty: 'medium',
  //     distance: '10km',
  //     challenge: 'river crossing',
  //     weather: 'sunny',
  //   )
  //       .then((output) {
  //     setState(() {
  //       generatedItems = output; // Display the generated items
  //     });
  //   }).catchError((e) {
  //     print('Error generating items: $e');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plan Your Adventure')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type of Adventure')),
            TextField(
                controller: _membersController,
                decoration: InputDecoration(labelText: 'Number of Members')),
            TextField(
                controller: _difficultyController,
                decoration: InputDecoration(labelText: 'Difficulty Level')),
            TextField(
                controller: _distanceController,
                decoration: InputDecoration(labelText: 'Distance')),
            TextField(
                controller: _challengeController,
                decoration: InputDecoration(labelText: 'Specific Challenge')),
            TextField(
                controller: _weatherController,
                decoration: InputDecoration(labelText: 'Weather Condition')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Generate Items')),
            SizedBox(height: 20),
            Text('Suggested Items:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(generatedItems),
          ],
        ),
      ),
    );
  }
}
