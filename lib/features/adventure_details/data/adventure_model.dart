import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';

class AdventureModel extends Adventure {
  /*
  that from Adventure and im gonna do ToJson() and FromJson() methods

  final String type;
  final int members;
  final String difficulty;
  final String distance;
  final String challenge;
  final String weather;
  
  */

  AdventureModel({
    required String type,
    required String members,
    required String difficulty,
    required String distance,
    required String challenge,
    required String weather,
  }) : super(
          type: type,
          members: members,
          difficulty: difficulty,
          distance: distance,
          challenge: challenge,
          weather: weather,
        );

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'members': members,
      'difficulty': difficulty,
      'distance': distance,
      'challenge': challenge,
      'weather': weather,
    };
  }
}
