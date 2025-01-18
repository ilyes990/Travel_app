import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/adventure_details/presentation/adventure_provider.dart';

class AdventureItemsBottomSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adventureItemsState = ref.watch(adventureItemsProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: adventureItemsState.when(
          loading: () => const Center(
                child: Text(
                  'Writing...',
                  style: TextStyle(fontSize: 18),
                ),
              ),
          error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Oops! Something went wrong 😓',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
          data: (items) {
            final itemList = items
                .split(RegExp(r'-|\n'))
                .map((item) => item.trim())
                .where((item) => item.isNotEmpty)
                .toList();
            return ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '• ${itemList[index]}',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
            );
          }),
    );
  }
}
