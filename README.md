# Flutter Weather App

A Flutter Application To Discover The Weather Using OpenWeatherMap API 🚀

# Overview
A simple weather app using Flutter that displays current weather information for a given city. It provides real-time weather updates, forecasts, and more. It uses the OpenWeatherMap API to fetch weather data. 

It has two screens: 
- Home screen with a search bar to enter a city name
- Weather details screen to display the weather information

On the home screen:
- A search bar where users can enter a city name
- A button to trigger the weather search
- A loading indicator while fetching data

On the weather details screen:
- City name
- Current temperature (in Celsius)
- Weather condition (e.g., cloudy, sunny, rainy)
- An icon representing the weather condition
- Humidity percentage
- Wind speed
- A "Refresh" button on the weather details screen to fetch updated weather data

# Dependencies
 - get - Manage states and inject dependencies.
 - dio - A powerful HTTP networking package for Dart/Flutter.
 - shared_preferences - Persistent storage for simple data.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# weather_app" 

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your local machine
- An API key from [OpenWeatherMap](https://openweathermap.org/api)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/weather_app.git
   cd weather_app

2. Get the required packages:
   ```bash
   flutter pub get

4. Create a lib/config.dart file with your OpenWeatherMap API key:
   ```bash
   const String apiKey = 'YOUR_API_KEY';

6. Run the app:
   ```bash
   flutter run
