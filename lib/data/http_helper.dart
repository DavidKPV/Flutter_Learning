import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:learning_flutter_app/data/weather.dart';

class HttpHelper {
  final String authority = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final String door = dotenv.env['API_WEATHER_KEY'] ?? 'dummy_key';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': door};

    Uri uri = Uri.https(authority, path, parameters);
    http.Response response = await http.get(uri);
    
    Map<String, dynamic> data = json.decode(response.body);
    Weather weather = Weather.fromJson(data);
    
    return weather;
  }
}
