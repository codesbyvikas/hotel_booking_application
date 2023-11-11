import 'hoteldata.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataHome {
  List<Data> getData = [
    Data(
        "https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=2048x2048&w=is&k=20&c=yhDN3-AsSRzQWjgRmXIvuMRC1GcNpWdqNzKF7ij8W4k=",
        "Sher Hotel",
        "Ludhiana, Punjab",
        "4575", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://www.itchotels.com/content/dam/itchotels/in/umbrella/images/brands-desktop/itc-maurya.png",
        "Luxury Hotel",
        "Delhi, India",
        "2344", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
        "Elite Hotel",
        "Mogadishu, Somalia",
        "5421", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/13/4a/f0/tiaraa-hotels-resorts.jpg?w=700&h=-1&s=1",
        "Five star Hotel",
        "Jodhpur, India",
        "542", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://www.travelandleisure.com/thmb/pCU_Y9fbQe4CT5Q73J9k2Bqd_bI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/header-grand-velas-los-cabos-MXALLINC0222-46d3772ad56f4493a83e1bcb49e119f9.jpg",
        "Maharaja Hotel",
        "Jaipur, India",
        "4545", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
        "Dolvin Hotel",
        "California, USA",
        "7421", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/13/4a/f0/tiaraa-hotels-resorts.jpg?w=700&h=-1&s=1",
        "Guest Hotel",
        "Bali, Indonesia",
        "5000", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://images.livemint.com/img/2022/07/16/600x338/oberoi_hotels_1_1657935679842_1657935694775_1657935694775.webp",
        "Elite Hotel",
        "Tokyo, Japan",
        "4214", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://www.tajhotels.com/content/dam/luxury/hotels/Taj_Lands_End_Mumbai/images/4x3/R&S_WOGLI_Exterior-Master.jpg",
        "Five star Hotel",
        "Dubai, UAE",
        "4525", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://media.timeout.com/images/105892648/image.jpg",
        "Country Side Hotel",
        "Nashik, India",
        "2132", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
    Data(
        "https://www.travelandleisure.com/thmb/pCU_Y9fbQe4CT5Q73J9k2Bqd_bI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/header-grand-velas-los-cabos-MXALLINC0222-46d3772ad56f4493a83e1bcb49e119f9.jpg",
        "Lion Hotel",
        "Indore, India",
        "2132", """Best Quality spacious rooms
24*7 room service available
27*7 accessibility to pool
Breakfast,Dinner and Lunch provided
wifi available"""),
  ];
}

List<String> trendingUrls = [
  "https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=2048x2048&w=is&k=20&c=yhDN3-AsSRzQWjgRmXIvuMRC1GcNpWdqNzKF7ij8W4k=",
  "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
  "https://www.itchotels.com/content/dam/itchotels/in/umbrella/images/brands-desktop/itc-maurya.png",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/13/4a/f0/tiaraa-hotels-resorts.jpg?w=700&h=-1&s=1",
  "https://images.livemint.com/img/2022/07/16/600x338/oberoi_hotels_1_1657935679842_1657935694775_1657935694775.webp"
];

List<String> recentUrls = [
  "https://www.tajhotels.com/content/dam/luxury/hotels/Taj_Lands_End_Mumbai/images/4x3/R&S_WOGLI_Exterior-Master.jpg",
  "https://media.timeout.com/images/105892648/image.jpg",
  "https://www.travelandleisure.com/thmb/pCU_Y9fbQe4CT5Q73J9k2Bqd_bI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/header-grand-velas-los-cabos-MXALLINC0222-46d3772ad56f4493a83e1bcb49e119f9.jpg"
];


