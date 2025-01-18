import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:travel_app/features/adventure_details/domain/adventure_entity.dart';
import 'package:travel_app/features/adventure_details/presentation/adventure_provider.dart';
import 'package:travel_app/features/adventure_details/presentation/widget/Adventure_Items_BottomSheet.dart';
import 'package:travel_app/generate_prompt.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdventureDetailsView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdventureDetailsViewState();
}

class _AdventureDetailsViewState extends ConsumerState<AdventureDetailsView> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _membersController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _distanceController = TextEditingController();
  final _challengeController = TextEditingController();
  final _weatherController = TextEditingController();

  List<String> adventuresTypes = [
    'Hiking ⛰️',
    'Camping 🏕️',
    'BikePacking 🚵‍♂️',
    'Roadtrip'
  ];
  List<String> weatherConditions = [
    'Sunny 🌞',
    'Rainy 🌧️',
    'Snowy ❄️',
    'Mixed/Unpredictable'
  ];
  List<String> difficultyLevels = ['Easy', 'Medium', 'Hard'];

  void _generateItems({
    required String? selectedAdventureType,
    required String? selectedDifficulty,
    required String? selectedWeatherCondition,
  }) {
    if (_formKey.currentState!.validate()) {
      final adventure = Adventure(
          type: selectedAdventureType ?? _typeController.text,
          members: _membersController.text,
          difficulty: selectedDifficulty ?? "unknown",
          distance: _distanceController.text,
          challenge: _challengeController.text,
          weather: selectedWeatherCondition ?? "unpredictable");
      ref.read(adventureItemsProvider.notifier).generateItems(adventure);

      showModalBottomSheet(
        context: context,
        builder: (_) => AdventureItemsBottomSheet(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedAdventureType = ref.watch(selectedAdventureTypeProvider);
    final selectedDifficulty = ref.watch(selectedDifficultyProvider);
    final selectedWeatherCondition =
        ref.watch(selectedWeatherConditionProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Form(
                key: _formKey,
                child: PageView(
                  children: [
                    first_PageView(selectedAdventureType, selectedDifficulty,
                        selectedWeatherCondition),
                    second_PageView(selectedWeatherCondition),
                  ],
                )),
          ),
          // BUTTON GENERATE
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () => _generateItems(
                  selectedAdventureType: selectedAdventureType,
                  selectedDifficulty: selectedDifficulty,
                  selectedWeatherCondition: selectedWeatherCondition,
                ),
                child: Text(
                  "Generate Items",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView second_PageView(String? selectedWeatherCondition) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          spacing: 12,
          children: [
            Text(
              "Distance (in km)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _distanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter distance (in km)',
                border: OutlineInputBorder(),
              ),
            ),

            // challenge
            Text(
              "Specific Challenge",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _challengeController,
              decoration: InputDecoration(
                labelText: 'Describe the challenge',
                border: OutlineInputBorder(),
              ),
            ),

            /// weather condition
            ///
            ///

            Text(
              "Expected Weather Condition",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: weatherConditions.map((condition) {
                final isSelected = selectedWeatherCondition == condition;
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedWeatherConditionProvider.notifier).state =
                        isSelected ? null : condition;
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.transparent,
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      condition,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView first_PageView(String? selectedAdventureType,
      String? selectedDifficulty, String? selectedWeatherCondition) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Adventure Type",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              children: adventuresTypes.map((type) {
                final isSelected = selectedAdventureType == type;
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedAdventureTypeProvider.notifier).state =
                        isSelected ? null : type;
                    if (!isSelected) {
                      _typeController.clear();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.transparent,
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      type,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            TextFormField(
              controller: _typeController,
              enabled: selectedAdventureType == null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: selectedAdventureType == null
                      ? Colors.transparent
                      : const Color.fromARGB(255, 57, 57, 57),
                  labelText: 'Other (Specify your type)',
                  labelStyle: TextStyle(
                      color: selectedAdventureType == null
                          ? Colors.white
                          : Colors.grey)),
              onChanged: (value) {
                ref.read(selectedAdventureTypeProvider.notifier).state = value;
              },
              validator: (value) {
                if ((selectedAdventureType == null ||
                        selectedAdventureType!.isEmpty) &&
                    (value == null || value.isEmpty)) {
                  return 'Please select or specify an adventure type.';
                }
                return null;
              },
            ),

            // NUMBER OF MEMBERS

            Text(
              "Number of Members",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            TextFormField(
              controller: _membersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter number of members',
                border: OutlineInputBorder(),
              ),
            ),

            Text(
              "Difficulty Level",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            DropdownButtonFormField<String>(
              value: selectedDifficulty,
              decoration: InputDecoration(
                labelText: 'Select difficulty level',
                border: OutlineInputBorder(),
              ),
              items: difficultyLevels
                  .map((level) =>
                      DropdownMenuItem(value: level, child: Text(level)))
                  .toList(),
              onChanged: (value) {
                ref.read(selectedDifficultyProvider.notifier).state = value!;
              },
            ),
            // Distance
          ],
        ),
      ),
    );
  }
}
