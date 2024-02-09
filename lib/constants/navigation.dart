import 'package:flutter/material.dart';
import 'package:hotel_booking_application/pages/favourites.dart';
import 'package:hotel_booking_application/pages/homepage.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int myIndex = 0;
  bool isLoading = false;
  final List _screens = const [HomePage(), Favourites()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _screens[myIndex],
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child:const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) async {
            if (myIndex != index) {
              setState(() {
                isLoading = true;
              });

              await Future.delayed(Duration(seconds: 2)); 

              setState(() {
                myIndex = index;
                isLoading = false;
              });
            } else {
              setState(() {
                myIndex = index;
              });
            }
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
