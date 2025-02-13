import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final String door = "";

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': door};

    Uri uri = Uri.https(authority, path, parameters);
    http.Response response = await http.get(uri);
    return response.body;
  }
}
