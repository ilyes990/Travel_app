import 'package:riverpod/riverpod.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';

import '../domain/adventure_use_case.dart';

class AdventureItemsNotifier extends StateNotifier<AsyncValue<String>> {
  final GenerateAdventureItemsUseCase generateAdventureItemsUseCase;

  AdventureItemsNotifier(this.generateAdventureItemsUseCase)
      : super(AsyncValue.data(""));

  Future<void> generateItems(Adventure adventure) async {
    state = AsyncValue.loading();
    try {
      final items = await generateAdventureItemsUseCase.call(adventure);
      state = AsyncValue.data(items);
    } catch (e, stk) {
      state = AsyncValue.error(e, stk);
    }
  }
}
