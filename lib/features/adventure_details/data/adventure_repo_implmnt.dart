/* im gonna make adventureRepositoryImpl that implements AdventureRepository and make Future<String> generateItems */

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:travel_app/features/adventure_details/data/adventure_model.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_repository.dart';

class AdventureRepositoryImpl implements AdventureRepository {
  @override
  Future<String> generateItems(Adventure adventure) async {
    final adventureModel = AdventureModel(
        type: adventure.type,
        members: adventure.members,
        difficulty: adventure.difficulty,
        distance: adventure.distance,
        challenge: adventure.challenge,
        weather: adventure.weather);

    try {
      final value = await Gemini.instance.prompt(parts: [
        Part.text(
            'Generate a list of essential items for an adventure. start with "here is a list of essential items of "type"")'
            'Type: ${adventureModel.type}, '
            'Members: ${adventureModel.members}, '
            'Difficulty: ${adventureModel.difficulty}, '
            'Distance: ${adventureModel.distance}, '
            'Challenge: ${adventureModel.challenge}, '
            'Weather: ${adventureModel.weather}.'
            ' Output only items. seperated ith - Example : Backpacks - Hiking boots - Tent, and dont write "-" example first-aid'),
      ]);
      return value?.output ?? "No item generated";
    } catch (e) {
      return Future.error(e);
    }
  }
}

/* 

String generatePrompt({
  required String type,
  required int members,
  required String difficulty,
  required String distance,
  required String challenge,
  required String weather,
}) {
  return '''
You are an expert adventure planner. Suggest a list of must-have items for an adventure based on these details:
- Type of Adventure: $type
- Number of Members: $members
- Difficulty: $difficulty
- Distance: $distance
- Specific Challenge: $challenge
- Weather Condition: $weather

Provide the list in bullet points, with each item as one word.
''';
}

*/
