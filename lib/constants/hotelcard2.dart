import 'package:flutter/material.dart';

import 'package:hotel_booking_application/pages/hoteldetails.dart';

class HotelCard2 extends StatelessWidget {
  final String imgUrl;
  final String hotelName;
  final String location;
  final String rating;
  final String price;
  final String facilities;
  const HotelCard2(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 160,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    hotelName,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(height: 10),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  
                  Row(
                    children: <Widget>[
                    
                      const Spacer(),

                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(color: Colors.teal),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 5),
          ],
        ),
      ),
    );
  }
}
