import 'package:flutter/material.dart';
import 'package:learning_flutter_app/data/http_helper.dart';
import 'package:learning_flutter_app/data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: "Enter a city",
                  suffixIcon: IconButton(
                      onPressed: getData, 
                      icon: Icon(Icons.search)
                  )
                ),
              ),
            ),
            weatherRow('Place: ', result.name),
            weatherRow('Description: ', result.description),
            weatherRow('Temperature: ', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived: ', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure: ', result.pressure.toString()),
            weatherRow('Humidity: ', result.humidity.toString()),
          ],
        ),
      )
    );
  }

  Future getData() async  {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {

    });
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).hintColor
                ),
              ),
            flex: 3,
          ),
          Expanded(
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor
                ),
              ),
            flex: 4,
          )
        ],
      ),
    );
    return row;
  }
}
