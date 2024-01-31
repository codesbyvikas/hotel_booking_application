import 'package:flutter/material.dart';

import 'package:hotel_booking_application/pages/hoteldetails.dart';

class HotelCard extends StatelessWidget {
  final String imgUrl;
  final String hotelName;
  final String location;
  final String rating;
  final String price;
  final String facilities;
  const HotelCard(
      {super.key,
      required this.imgUrl,
      required this.hotelName,
      required this.location,
      required this.rating,
      required this.price,
      required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 22),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HotelDetails(
                    imgUrl: imgUrl,
                    hotelName: hotelName,
                    location: location,
                    rating: rating,
                    price: price,
                    facilities: facilities,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
              scale: 2.0,
            ),
          ),
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    for (var i = 0; i < int.parse(rating); i++)
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFE8C68),
                        size: 18,
                      ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        location,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 6)
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 16, 183, 136)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price starts from ₹$price",
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
