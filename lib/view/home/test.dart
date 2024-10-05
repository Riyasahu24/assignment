import 'package:assignment/view/home_detail/home_detail_card.dart';
import 'package:assignment/view/my_qr/my_qr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPos = 2; // Default selected position

  static const List<Widget> _homeChild = [
    Center(child: Text('My Bookings')),
    Center(child: Text('Scan QR')),
    HomeCard(),
    MyQr(),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedPos = index; // Update the selected position
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.withOpacity(.1),
        scrolledUnderElevation: 0.3,
        elevation: 0,
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.lightBlue,
                ),
                Text(
                  'Ny 11434, USA',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(width: 40),
            Text(
              "Walk-in",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(width: 4),
          Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          _homeChild[selectedPos], // Display the selected widget
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // Position the BottomNavigationBar at the bottom
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.book_outlined),
                  label: 'My Booking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code),
                  label: 'Scan QR',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons
                      .emoji_emotions), // Placeholder for the enlarged home icon
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner_outlined),
                  label: 'My QR',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: selectedPos, // Highlight the selected item
              selectedItemColor: Colors.lightBlue,
              onTap: _onItemTapped, // Update selected position on tap
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ],
      ),
    );
  }
}
