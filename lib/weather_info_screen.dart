import 'dart:convert';
import 'package:flutter/material.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({Key? key}) : super(key: key);

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  List<Weather> weather = [];

  @override
  void initState() {
    super.initState();
    String jsonString = '''
      [
        {
          "city": "New York",
          "temperature": 20,
          "condition": "Clear",
          "humidity": 60,
          "windSpeed": 5.5
        },
        {
          "city": "Los Angeles",
          "temperature": 25,
          "condition": "Sunny",
          "humidity": 50,
          "windSpeed": 6.8
        },
        {
          "city": "London",
          "temperature": 15,
          "condition": "Partly Cloudy",
          "humidity": 70,
          "windSpeed": 4.2
        },
        {
          "city": "Tokyo",
          "temperature": 28,
          "condition": "Rainy",
          "humidity": 75,
          "windSpeed": 8.0
        },
        {
          "city": "Sydney",
          "temperature": 22,
          "condition": "Cloudy",
          "humidity": 55,
          "windSpeed": 7.3
        }
      ]
    ''';

    List<Map<String, dynamic>> responseData =
        List<Map<String, dynamic>>.from(jsonDecode(jsonString));

    for (Map<String, dynamic> mapWeather in responseData) {
      weather.add(Weather(
        mapWeather['city'],
        mapWeather['temperature'],
        mapWeather['condition'],
        mapWeather['humidity'],
        mapWeather['windSpeed'],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Info App')),
      body: ListView.builder(
        itemCount: weather.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(weather[index].city),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${weather[index].temperature}°C'),
                  Text('Condition: ${weather[index].condition}'),
                  Text('Humidity: ${weather[index].humidity}%'),
                  Text('Wind Speed: ${weather[index].windSpeed} km/h'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Weather {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather(this.city, this.temperature, this.condition, this.humidity,
      this.windSpeed);
}
