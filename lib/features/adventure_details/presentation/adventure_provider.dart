import 'package:riverpod/riverpod.dart';
import 'package:travel_app/features/adventure_details/data/adventure_repo_implmnt.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_repository.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_use_case.dart';
import 'package:travel_app/features/adventure_details/presentation/Adventure_controller.dart';

// adventure Repository provider

final adventurerepositoryProvider = Provider<AdventureRepository>(
  (ref) => AdventureRepositoryImpl(),
);

// Use case

final generateItemUsecaseProvider = Provider<GenerateAdventureItemsUseCase>(
  (ref) {
    return GenerateAdventureItemsUseCase(ref.read(adventurerepositoryProvider));
  },
);

// Item state Notifier

final adventureItemsProvider =
    StateNotifierProvider<AdventureItemsNotifier, AsyncValue<String>>(
  (ref) {
    return AdventureItemsNotifier(ref.read(generateItemUsecaseProvider));
  },
);

// selected adventure type provider

final selectedAdventureTypeProvider = StateProvider<String?>((ref) => null);
final selectedDifficultyProvider = StateProvider<String?>((ref) => null);
final selectedWeatherConditionProvider = StateProvider<String?>((ref) => null);
