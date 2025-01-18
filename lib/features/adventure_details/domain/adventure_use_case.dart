import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_repository.dart';

class GenerateAdventureItemsUseCase {
  final AdventureRepository repository;

  GenerateAdventureItemsUseCase(this.repository);

  Future<String> call(Adventure adventure) async {
    return repository.generateItems(adventure);
  }
}
