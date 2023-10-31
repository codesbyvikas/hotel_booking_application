import 'package:flutter/material.dart';

class HotelDetails extends StatelessWidget {
  final String imgUrl;
  final String hotelName;
  final String location;
  final double rating;
  final String price;
  final String facilities;

  const HotelDetails(
      {super.key,
      required this.imgUrl,
      required this.hotelName,
      required this.location,
      required this.rating,
      required this.price,
      required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "₹$price",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  width: 180,
                ),
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
                                  onPressed: () =>
                                      Navigator.pop(context, 'okay'),
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
                      image: NetworkImage(imgUrl), fit: BoxFit.fill),
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
                                color: Color(0xffF8FCFF),
                                borderRadius: BorderRadius.circular(12)),
                            width: 40,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffF8FCFF),
                                borderRadius: BorderRadius.circular(12)),
                            width: 40,
                            child: const Icon(
                              Icons.favorite_border,
                              size: 30,
                            ),
                          ),
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
                      hotelName,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20),
                        Text(location,
                            style: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        for (var i = 0; i < rating; i++)
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFE8C68),
                            size: 18,
                          ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("$rating/5")
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
                      "Facilities",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      facilities,
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
                        color: Color.fromARGB(255, 114, 195, 233),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.pool, size: 40),
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
}
