import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

class HttpHelper {
  final String authority = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final String door = dotenv.env['API_WEATHER_KEY'] ?? 'dummy_key';

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': door};

    Uri uri = Uri.https(authority, path, parameters);
    http.Response response = await http.get(uri);
    return response.body;
  }
}
