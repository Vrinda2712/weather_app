import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  final String city;

  WeatherScreen({required this.city});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<WeatherProvider>(context, listen: false).fetchWeather(widget.city);
            },
          ),
        ],
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.weatherData != null) {
            final data = provider.weatherData!;
            final weatherCondition = data['weather'][0]['main'];
            final weatherIcon = provider.getWeatherIcon(weatherCondition);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text('Weather in ${data['name']}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  BoxedIcon(weatherIcon, size: 100),
                  SizedBox(height: 20),
                  Text('${data['main']['temp']}°C', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                  Text('${data['weather'][0]['description']}', style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.water_drop, size: 30, color: Colors.blue),
                          SizedBox(height: 5),
                          Text('Humidity: ${data['main']['humidity']}%', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        children: [
                          Icon(Icons.wind_power, size: 30, color: Colors.blue),
                          SizedBox(height: 5),
                          Text('Wind: ${data['wind']['speed']} m/s', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<WeatherProvider>(context, listen: false).fetchWeather(widget.city);
                    },
                    child: Text('Refresh', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            );
          } else if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.error!, style: TextStyle(color: Colors.red, fontSize: 20)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<WeatherProvider>(context, listen: false).fetchWeather(widget.city);
                    },
                    child: Text('Try Again', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available', style: TextStyle(fontSize: 20)));
          }
        },
      ),
    );
  }
}
