import 'package:hotel_booking_application/models/hotels.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class APiCalls {
  Future<HotelsData?> fetchData() async {
    final String apiUrl = 'https://worldwide-hotels.p.rapidapi.com/search';

    Map<String, String> headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': '684687ead8mshf5bec3a5d587221p102c60jsnc0e5ab005c99',
      'X-RapidAPI-Host': 'worldwide-hotels.p.rapidapi.com',
    };

    Map<String, String> data = {
      'location_id': '45963',
      'language': 'en_US',
      'currency': 'USD',
      'offset': '0',
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        // Successful response
        final jsonData = json.decode(response.body);
        HotelsData data = HotelsData.fromJson(jsonData);
         print(jsonData);
        return data;
    
      } else {
        // Handle other status codes
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
      return null;
    }
  }
 
}
 
