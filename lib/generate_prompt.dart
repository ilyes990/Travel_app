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
