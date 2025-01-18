import 'package:flutter/material.dart';
import 'package:travel_app/Questionnaire/form_page.dart';
import 'package:travel_app/features/adventure_details/presentation/adventure_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Assuming dark theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.person, color: Colors.white),
        title:
            Text('Good morning, Ilyes', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Past Adventures', style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {},
                  child: Text('See more', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdventureDetailsView()),
                          );
                        },
                        child: Image.network(
                          '', // Replace with actual URL
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hiking trip',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text('Seraïdi, Annaba',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 70,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({
//     super.key,
//   });

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   child: Image.asset(
//                     'assets/beautiful.jpg', // Updated image asset path
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               color: const Color.fromARGB(
//                   107, 0, 0, 0), // Semi-transparent black overlay
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const SizedBox(height: 50),
//                   Container(
//                     height: 60,
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           prefixIcon: IconButton(
//                             icon: const Icon(Icons.search),
//                             onPressed: () {},
//                           ),
//                           suffixIcon: IconButton(
//                             icon: const Icon(Icons.filter_list),
//                             onPressed: () {},
//                           ),
//                           hintText: 'Search',
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Discover your next luxury escape',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Explore unique destinations personalized just for you',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black, // Button background color
//                       foregroundColor: Colors.white, // Button foreground color
//                       minimumSize:
//                           const Size(200, 50), // Set the width and height
//                     ),
//                     child: const Text(
//                       'Start Exploring Now',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.45,
//               left: 0,
//               right: 0,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.55,
//                   width: double.infinity,
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       const Text(
//                         'Essential Travel Companion',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'For everyone who want to travel now in responsible ways',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const RowButtons(),
//                       const SizedBox(height: 20),
//                       const ScrollableCards(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Book',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.card_travel),
//             label: 'Trips',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class RowButtons extends StatelessWidget {
//   const RowButtons({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           ButtonFilter(title: 'Africa'),
//           const SizedBox(width: 10),
//           ButtonFilter(title: 'Asia'),
//           const SizedBox(width: 10),
//           ButtonFilter(title: 'Europe'),
//           const SizedBox(width: 10),
//           ButtonFilter(title: 'America'),
//         ],
//       ),
//     );
//   }
// }

// class ButtonFilter extends StatelessWidget {
//   final String title;
//   const ButtonFilter({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.grey[300], // Button background color
//         foregroundColor: Colors.black, // Button foreground color
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontWeight: FontWeight.w300,
//         ),
//       ),
//     );
//   }
// }

// class ScrollableCards extends StatelessWidget {
//   const ScrollableCards({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           CardItem(imagePath: 'assets/image1.jpg'),
//           const SizedBox(width: 10),
//           CardItem(imagePath: 'assets/image2.jpg'),
//           const SizedBox(width: 10),
//           CardItem(imagePath: 'assets/image3.jpg'),
//           const SizedBox(width: 10),
//           CardItem(imagePath: 'assets/image4.jpg'),
//         ],
//       ),
//     );
//   }
// }

// class CardItem extends StatelessWidget {
//   final String imagePath;
//   const CardItem({
//     super.key,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: 150,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 10,
//           right: 10,
//           child: Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(157, 224, 224, 224),
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.favorite_border),
//               color: Colors.white,
//               onPressed: () {},
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
