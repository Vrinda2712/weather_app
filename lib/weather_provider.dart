import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/weather_service.dart';
import 'package:weather_icons/weather_icons.dart';
import 'dart:io'; // for SocketException

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData;
  String? _error;
  bool _isLoading = false;

  Map<String, dynamic>? get weatherData => _weatherData;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(String city) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _weatherData = await _weatherService.fetchWeather(city);
    } on SocketException {
      _error = 'No internet connection';
    } on HttpException catch (e) {
      _error = e.message.contains('404') 
               ? 'City not found'
               : e.message.contains('429')
               ? 'API limit exceeded, try again later'
               : 'Failed to load weather data';
    } on TimeoutException {
      _error = 'Request timed out';
    } catch (e) {
      _error = 'Failed to load weather data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  IconData getWeatherIcon(String condition) {
    switch (condition) {
      case 'Thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'Drizzle':
        return WeatherIcons.sprinkle;
      case 'Rain':
        return WeatherIcons.rain;
      case 'Snow':
        return WeatherIcons.snow;
      case 'Clear':
        return WeatherIcons.day_sunny;
      case 'Clouds':
        return WeatherIcons.cloud;
      default:
        return WeatherIcons.cloudy;
    }
  }
}
