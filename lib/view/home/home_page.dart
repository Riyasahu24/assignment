import 'package:assignment/view/home_detail/home_detail_card.dart';
import 'package:assignment/view/my_qr/my_qr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPos = 2;
  late CircularBottomNavigationController _navigationController;

  List<TabItem> tabItems = [
    TabItem(
      Icons.book_outlined,
      "My Booking",
      Colors.lightBlue,
    ),
    TabItem(
      Icons.qr_code,
      "Scan QR",
      Colors.lightBlue,
    ),
    TabItem(
      Icons.emoji_emotions,
      "Home",
      Colors.lightBlue,
    ),
    TabItem(
      Icons.qr_code_scanner_outlined,
      "My QR",
      Colors.lightBlue,
    ),
    TabItem(
      Icons.person,
      "Profile",
      Colors.lightBlue,
    ),
  ];

  static const List<Widget> _homeChild = [
    Center(child: Text('My Bookings')),
    Center(
      child: Text('Scan QR'),
    ),
    HomeCard(),
    MyQr(),
    Center(
      child: Text('Profile'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
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
              SizedBox(
                width: 40,
              ),
              Text(
                "Walk-in",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.notifications_none,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              child: _homeChild[selectedPos],
            ),
            Positioned(bottom: 0, child: bottomNav()),
          ],
        )
        //  IndexedStack(
        //   index: selectedPos,
        //   children: _homeChild,

        // ),
        // bottomNavigationBar: bottomNav(),
        );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      circleStrokeWidth: 0,
      animationDuration: const Duration(milliseconds: 200),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          if (kDebugMode) {
            print(_navigationController.value);
          }
        });
      },
    );
  }
}
