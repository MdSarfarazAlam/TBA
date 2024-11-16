import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchLocationData {
  Future<List> getHotelData(val) async {
    print('val in api call $val');
    var url =
        "https://engine.hotellook.com/api/v2/lookup.json?query=$val&lang=en&lookFor=both&limit=100&token=162151";

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    List<dynamic> values = data['results']['locations'];
    print("${data}check hotel data printed");
    return values;
  }
}
