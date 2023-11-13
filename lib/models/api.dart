import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<Map<String, dynamic>> fetchHotelData() async {
    var url = 'https://worldwide-hotels.p.rapidapi.com/search';
    var headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': '5ae7de98e2msh1941f7a413b578bp1127bcjsnc74e41329b80',
      'X-RapidAPI-Host': 'worldwide-hotels.p.rapidapi.com',
    };

    var body = {
      'location_id': '45963',
      'language': 'en_US',
      'currency': 'USD',
      'offset': '0',
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      return decodedData;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
