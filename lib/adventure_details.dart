import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:travel_app/generate_prompt.dart';

class GeminiService extends StatelessWidget {
  final Gemini gemini = Gemini.instance;
  GeminiService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with location and edit icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seraidi, Annaba',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/400x200'), // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Title
              Text(
                'Hiking trip',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Date
              Text(
                'Dec 15, 2023 - Dec 16, 2023',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 16),
              // Description
              Text(
                'Get an inside look into traditional sustainable farming and its impact on the coffee industry. You\'ll learn about every stage of the production process, from growing to roasting, by local experts who\'ll take you on a walk-through of a scenic farm...',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 16),
              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Media', style: TextStyle(color: Colors.white)),
                  Text('Location', style: TextStyle(color: Colors.white)),
                  Text('Lists', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 16),
              // Essential List
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Essential list',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('Hat',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('Sunglasses',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('FlashLight',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('Gloves',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('RainShell',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('Gps system',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('Pedometre tracking',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text('Digital watch',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.refresh),
                        SizedBox(width: 8),
                        Text('Generate'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> getAdventureItems({
    required String type,
    required int members,
    required String difficulty,
    required String distance,
    required String challenge,
    required String weather,
  }) async {
    final prompt = generatePrompt(
      type: type,
      members: members,
      difficulty: difficulty,
      distance: distance,
      challenge: challenge,
      weather: weather,
    );

    final response =
        await gemini.prompt(parts: [Part.text(prompt)]).then((value) {
      final output = value?.output ?? "No response from Gemini";
      print('generated items $output');
    }).catchError((error) {
      print('Error: $error');
    });

    print(
        response.choices.first.message.content); // This is your generated list
  }
}
