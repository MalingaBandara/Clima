# Clima - Weather Forecasting iOS Application

## Project Overview

Clima is a weather forecasting iOS application developed using Swift and UIKit. This project demonstrates how to integrate third-party APIs to fetch real-time weather data and present it in a user-friendly interface. The primary goal of this project was to explore mobile app development using Swift, API integration, and dynamic UI updates.

## Key Features

- **Real-time Weather Data**: Fetches current weather conditions based on user location or city input.
- **API Integration**: Utilizes the OpenWeatherMap API to retrieve weather information.
- **Dynamic UI**: The app adjusts its interface based on the weather conditions (e.g., icons and background changes).
- **Learning-Focused**: Built as part of an educational journey to improve Swift skills and understand API consumption in iOS development.

## Technologies Used

- **Swift**
- **UIKit**
- **Core Location**
- **OpenWeatherMap API**
- **MVC Architecture**

## Project Structure and Code Explanation

1. **API Manager**:
   - Handles API requests and parses JSON data.
   ```swift
   struct WeatherManager {
       func fetchWeather(cityName: String) {
           // Code to make API request and parse response
       }
   }
   ```

2. **User Interface**:
   - Dynamic UI updates based on fetched weather data.
   ```swift
   class WeatherViewController: UIViewController {
       @IBOutlet weak var temperatureLabel: UILabel!
       // Other UI elements
   }
   ```

3. **Core Location Integration**:
   - Uses Core Location to get the user’s current location and fetch weather data accordingly.
   ```swift
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       // Code to handle location updates
   }
   ```

## Committing Strategy and Learning Insights

The repository follows a structured commit strategy focused on learning Swift and API integration:
- **Initial Setup Commits**: Includes setting up the project, integrating the API, and configuring Core Location.
- **Feature Implementation Commits**: Each commit adds key features such as fetching weather data, parsing JSON, and UI updates.
- **Refactoring and Optimization Commits**: Commits focus on improving code readability, performance, and UI enhancements.
- **Documentation and Commenting**: Includes commits that enhance code clarity and add detailed comments for better understanding.

These commit strategies emphasize the learning process and the incremental addition of features.

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/MalingaBandara/Clima.git
   ```
2. Open the project in Xcode.
3. Run the app on an iOS simulator or a connected device.
4. Make sure to add your OpenWeatherMap API key in the `WeatherManager.swift` file.

## Purpose and Future Enhancements

The Clima project was developed to explore iOS development using Swift and improve skills in API integration. Future enhancements could include adding weather forecasts, hourly updates, and improving the UI with animations and transitions.
