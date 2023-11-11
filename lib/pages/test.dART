import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final url = Uri.parse('https://worldwide-hotels.p.rapidapi.com/search');
  
  final headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'X-RapidAPI-Key': '684687ead8mshf5bec3a5d587221p102c60jsnc0e5ab005c99',
    'X-RapidAPI-Host': 'worldwide-hotels.p.rapidapi.com'
  };

  final encodedParams = {
    'location_id': '45963',
    'language': 'en_US',
    'currency': 'USD',
    'offset': '0',
  };

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: encodedParams,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}

void main() {
  fetchData();
}
