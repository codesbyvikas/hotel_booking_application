import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_application/constants/hotelcard.dart';
import 'package:hotel_booking_application/constants/hotelcard2.dart';
import 'package:hotel_booking_application/data/hotellist.dart';
import 'package:hotel_booking_application/models/api.dart';
import 'package:hotel_booking_application/models/hotels.dart';

import 'package:hotel_booking_application/pages/hoteldetails.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataHome obj = DataHome();
  HotelsModel hoteldata = HotelsModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: ListView(
                children: [
                  const Text(
                    "Hotels.com",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 16, 183, 136),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "Find your perfect",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Stay",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  searchBar(),
                  const SizedBox(height: 20),
                  const Text(
                    "Recently Viewed",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  recentHotels(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Trending",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {}, child: const Text("See All"))
                    ],
                  ),
                  trendingHotels(),
                  const SizedBox(
                    height: 15,
                  ),

                  const Text(
                    "Suggested",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // suggestedHotels(),
                  hotelBuilder(),
                  logout(),
                ],
              ))),
    );
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

  Widget logout() {
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

  Widget recentHotels() {
    return Container(
      height: 150,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          HotelCard(
            imgUrl: recentUrls[0],
            hotelName: "gg",
            location: "Chandigarh",
            rating: "4",
            price: "6554",
            facilities: """Best Quality spacious rooms
            24*7 room service available
            27*7 accessibility to pool
            Breakfast,Dinner and Lunch provided
            wifi available""",
          ),
          HotelCard(
            imgUrl: recentUrls[1],
            hotelName: "Riverview",
            location: " Indore,India",
            rating: "3",
            price: "5422",
            facilities: """Best Quality spacious rooms
            24*7 room service available
            27*7 accessibility to pool
            Breakfast,Dinner and Lunch provided
            wifi available""",
          ),
          HotelCard(
            imgUrl: recentUrls[2],
            hotelName: "Stiffer",
            location: "Germany",
            rating: "5",
            price: "4512",
            facilities: """Best Quality spacious rooms
            24*7 room service available
            27*7 accessibility to pool
            Breakfast,Dinner and Lunch provided
            wifi available""",
          )
        ],
      ),
    );
  }

  Widget trendingHotels() {
    return Container(
      height: 250,
      child: Builder(builder: (context) {
        return ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            HotelCard(
              imgUrl: trendingUrls[0],
              hotelName: "Paramount Hotel",
              location: "Mumbai,India",
              rating: "4",
              price: "5000",
              facilities: """Best Quality spacious rooms
              24*7 room service available
              27*7 accessibility to pool
              Breakfast,Dinner and Lunch provided
              wifi available""",
            ),
            HotelCard(
              imgUrl: trendingUrls[1],
              hotelName: "Hotel Vishwash",
              location: "Bangalore,India",
              rating: "3",
              price: "3500",
              facilities: """Best Quality spacious rooms
              24*7 room service available
              27*7 accessibility to pool
              Breakfast,Dinner and Lunch provided
              wifi available""",
            ),
            HotelCard(
              imgUrl: trendingUrls[3],
              hotelName: "Abode",
              location: "Italy",
              rating: "5",
              price: "6522",
              facilities: """Best Quality spacious rooms
              24*7 room service available
              27*7 accessibility to pool
              Breakfast,Dinner and Lunch provided
              wifi available""",
            ),
            HotelCard(
              imgUrl: trendingUrls[2],
              hotelName: "hjhg",
              // hotelName: hotelsdata != null ? hotelsdata!.name : "r",
              location: "New York,USA",
              rating: "4",
              price: "5457",
              facilities: """Best Quality spacious rooms
              24*7 room service available
              27*7 accessibility to pool
              Breakfast,Dinner and Lunch provided
              wifi available""",
            ),
            HotelCard(
              imgUrl: trendingUrls[4],
              hotelName: "HoverStay ",
              location: "London, UK",
              rating: "5",
              price: "35443",
              facilities: """Best Quality spacious rooms
              24*7 room service available
              27*7 accessibility to pool
              Breakfast,Dinner and Lunch provided
              wifi available""",
            )
          ],
        );
      }),
    );
  }

  Widget suggestedHotels() {
    return ListView.builder(
        itemCount: obj.getData.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HotelDetails(
                              imgUrl: obj.getData[index].imageUrl.toString(),
                              hotelName: obj.getData[index].name.toString(),
                              location: obj.getData[index].location.toString(),
                              rating: "4",
                              price: obj.getData[index].price.toString(),
                              facilities:
                                  obj.getData[index].facilities.toString(),
                            )));
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                              obj.getData[index].imageUrl.toString(),
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            obj.getData[index].name.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            obj.getData[index].location.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              for (var i = 0; i < 4; i++)
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFFE8C68),
                                  size: 18,
                                ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color.fromARGB(255, 16, 183, 136)),
                            child: Text(
                              "Starts from  ₹" +
                                  obj.getData[index].price.toString(),
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget hotelBuilder() {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: ApiCalls.fetchHotelData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // Access the data through the model class
            HotelsModel responsedata = HotelsModel.fromJson(snapshot.data);

            return SingleChildScrollView(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: responsedata.results!.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: HotelCard2(
                            imgUrl: responsedata.results!.data![index].photo!
                                .images!.medium!.url
                                .toString(),
                            hotelName: responsedata.results!.data![index].name
                                .toString(),
                            location: responsedata
                                .results!.data![index].locationString
                                .toString(),
                            rating: responsedata.results!.data![index].rating
                                .toString(),
                            price: responsedata.results!.data![index].price
                                .toString(),
                            facilities: responsedata
                                .results!.data![index].description
                                .toString()));
                  }),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Text('Unknown error');
          }
        },
      ),
    );
  }
}
