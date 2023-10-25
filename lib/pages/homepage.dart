import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_application/data/hotelcard.dart';
import 'package:hotel_booking_application/pages/hotellist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ListView(
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 20),
                searchBar(),
                const SizedBox(height: 20),
                Text(
                  "Trending",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                trendingHotels(),
                SizedBox(
                  height: 10,
                ),
                Logout(),
              ],
            )));
  }

  Widget searchBar() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      shadowColor: const Color(0x55434343),
      child: const TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: "search for hotels",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black45,
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget Logout() {
    return Center(
      child: InkWell(
        onTap: () {
          FirebaseAuth.instance.signOut();
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget trendingHotels() {
    return Container(
      height: 250,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          hotelCard(urls[0], "Paramount Hotel", "Mumbai,India", 4),
          hotelCard(urls[1], "Hotel Vishwash", " Bangalore,India", 4.5),
          hotelCard(urls[3], "Abode", "Italy", 3),
          hotelCard(urls[2], "EverStay", "New York,USA", 4),
          hotelCard(urls[4], "HoverStay ", "London, UK", 3.5)
        ],
      ),
    );
  }
}
