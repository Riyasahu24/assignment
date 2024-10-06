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
      'assets/images/vector_smart_object_5.png',
      "My Booking",
      Colors.lightBlue,
      'assets/images/layer_16.png',
    ),
    TabItem(
      'assets/images/vector_smart_object_8.png',
      "Scan QR",
      Colors.lightBlue,
      'assets/images/group_3.png',
    ),
    TabItem(
      'assets/images/vector_smart_object_copy_3_2.png',
      "Home",
      Colors.lightBlue,
      'assets/images/vector_smart_object.png',
    ),
    TabItem(
      'assets/images/shape_1.png',
      "My QR",
      Colors.lightBlue,
      'assets/images/group_3.png',
    ),
    TabItem(
      'assets/images/ic_profile.png',
      "Profile",
      Colors.lightBlue,
      'assets/images/group_10.png',
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
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/images/location.png'),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Ny 11434, USA',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/ic_logo_color.png',
                height: 40,
                width: 150,
              ),
            ],
          ),
          actions: [
            Image.asset('assets/images/vector_smart_object_6.png'),
            const SizedBox(
              width: 16,
            ),
            Image.asset('assets/images/vector_smart_object_7.png'),
            const SizedBox(
              width: 16,
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
        ));
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      circleSize: 70,
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
