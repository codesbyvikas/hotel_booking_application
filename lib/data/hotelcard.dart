import 'package:flutter/material.dart';

Widget hotelCard(
    String imgUrl, String hotelName, String location, double rating) {
  return Card(
    margin: const EdgeInsets.only(right: 22),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: InkWell(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
            scale: 2.0,
          )),
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    for (var i = 0; i < rating; i++)
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFE8C68),
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
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 6)
                  ],
                )),
              ],
            ),
          )),
    ),
  );
}
