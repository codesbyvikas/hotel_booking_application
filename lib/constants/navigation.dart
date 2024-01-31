import 'package:flutter/material.dart';
import 'package:hotel_booking_application/pages/favourites.dart';
import 'package:hotel_booking_application/pages/homepage.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int myIndex = 0;
  final List _screens = const [HomePage(), Favourites()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[myIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          backgroundColor: const Color.fromARGB(255, 236, 237, 238),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: myIndex == 0 ? Colors.teal : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: myIndex == 1 ? Colors.red : Colors.grey,
              ),
              label: "Favourites",
            ),
          ],
        ),
      ),
    );
  }
}
