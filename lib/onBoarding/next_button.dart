import 'package:flutter/material.dart';
import 'package:travel_app/home_view.dart';

class NextButton extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int pageCount;

  const NextButton({
    required this.pageController,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 70,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Background color
            foregroundColor: Colors.white, // Foreground (text) color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Border radius
            ),
          ),
          onPressed: () {
            if (currentPage < pageCount - 1) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // Navigate to the next screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ),
              );
            }
          },
          child: Text(currentPage < pageCount - 1 ? 'NEXT' : 'GET STARTED'),
        ),
      ),
    );
  }
}
