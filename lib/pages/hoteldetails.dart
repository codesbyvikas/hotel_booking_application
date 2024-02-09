import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oktoast/oktoast.dart';

class HotelDetails extends StatefulWidget {
  final String imgUrl;
  final String hotelName;
  final String location;
  final String rating;
  final String price;
  final String facilities;

  HotelDetails(
      {super.key,
      required this.imgUrl,
      required this.hotelName,
      required this.location,
      required this.rating,
      required this.price,
      required this.facilities});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.price,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 16, 183, 136),
                  ),
                  child: TextButton(
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      notify(1, "Congratulations",
                          "Your Booking to ${widget.hotelName} is confirmed");
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Booking status',
                            style: TextStyle(color: Colors.green),
                          ),
                          content: const Text(
                              'Your Booking is Successfully Confirmed'),
                          actions: <Widget>[
                            Center(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Colors.green, // Background Color
                                ),
                                onPressed: () => Navigator.pop(context, 'okay'),
                                child: const Text(
                                  'okay',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.imgUrl), fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xffF8FCFF),
                                borderRadius: BorderRadius.circular(12)),
                            width: 40,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 20,
                              ),
                            ),
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("users-favourite-hotels")
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection("hotels")
                                  .where("name", isEqualTo: widget.hotelName)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.data == null) {
                                  return const Text("");
                                }
                                return Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF8FCFF),
                                      borderRadius: BorderRadius.circular(12)),
                                  width: 40,
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite),
                                    color: snapshot.data!.docs.isEmpty
                                        ? Colors.grey
                                        : Colors.red,
                                    onPressed: () {
                                      snapshot.data!.docs.isEmpty
                                          ? addToFavourite()
                                          : removeFromFavorite();
                                    },
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hotelName,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 20),
                        Text(widget.location,
                            style: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        for (var i = 0;
                            i < double.parse(widget.rating).toInt();
                            i++)
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFE8C68),
                            size: 18,
                          ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("${widget.rating}/5")
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Details",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      widget.facilities,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 145, 233, 148),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.wifi, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 158, 228, 221),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.ac_unit_rounded, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 214, 167),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.restaurant, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 145, 233, 148),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.car_rental, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 114, 195, 233),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.pool, size: 40),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-hotels");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("hotels")
        .doc()
        .set({
      "name": widget.hotelName,
      "location": widget.location,
      "price": widget.price,
      "images": widget.imgUrl,
      "rating": widget.rating,
      "details": widget.facilities,
    }).then((value) {
      _showToast("Added to favorites");
      notify(2, "Confirmed", "${widget.hotelName} is added to Favourrtes");
    });
  }

  Future removeFromFavorite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-hotels");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("hotels")
        .where("name", isEqualTo: widget.hotelName)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
        _showToast("Removed from favorites");
        notify(
            3, "Confirmed", "${widget.hotelName} is removed from Favourites");
      });
    });
  }

  void _showToast(String message) {
    showToast(
      message,
      duration: Duration(seconds: 2),
      position: ToastPosition.bottom,
    );
  }

  void notify(int id, String title, String body) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: 'key1',
          title: title,
          body: body,
          bigPicture: "assets/images/hotel.png",
          notificationLayout: NotificationLayout.BigPicture),
    );
  }
}
