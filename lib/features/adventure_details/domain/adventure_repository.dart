import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';

abstract class AdventureRepository {
  Future<String> generateItems(Adventure adventure);
}
