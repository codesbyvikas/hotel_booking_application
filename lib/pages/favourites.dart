import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_application/constants/hotelcard2.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: const Text(
            "Favourites",
            style: TextStyle(color: Colors.teal),
          )),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users-favourite-hotels")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection("hotels")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return const Center(child: Text("Nothing to show here"));
            } else {
              return SingleChildScrollView(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: HotelCard2(
                              imgUrl: snapshot.data!.docs[index]['images'],
                              hotelName: snapshot.data!.docs[index]['name'],
                              location: snapshot.data!.docs[index]['location'],
                              rating: snapshot.data!.docs[index]['rating'],
                              price: snapshot.data!.docs[index]['price'],
                              facilities: snapshot.data!.docs[index]
                                  ['details']));
                    }),
              );
            }
          }),
    );
  }
}
