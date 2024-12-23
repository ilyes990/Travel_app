import 'package:flutter/material.dart';

class BuildGridView extends StatefulWidget {
  const BuildGridView({super.key});

  @override
  _BuildGridViewState createState() => _BuildGridViewState();
}

class _BuildGridViewState extends State<BuildGridView> {
  int _selectedIndex = -1;

  final List<Location> locations = [
    Location(icon: Icons.park, text: 'Wood'),
    Location(icon: Icons.terrain, text: 'Mountain'),
    Location(icon: Icons.wb_sunny, text: 'Desert'),
    Location(icon: Icons.ac_unit, text: 'Snow'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: locations.length,
      itemBuilder: (context, index) {
        bool isSelected = _selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: isSelected ? Colors.black : Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    locations[index].icon,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  Text(
                    locations[index].text,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Location {
  final IconData icon;
  final String text;

  Location({required this.icon, required this.text});
}
