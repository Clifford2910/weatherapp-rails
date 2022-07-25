# Ruby / Rails Weather App

## Context

* You are a senior member of a team tasked with developing the web front-end of a new, intelligent weather forecasting service. While the data science team are reading the clouds, the Venture is keen to get a proof of concept up and running.

* The application should use the OpenWeatherMap API, as the eventual smart data will have a similar structure. Users must be able to provide their location, and see at least the current weather, temperature, sunrise and sunset times.

* Framework and look and feel are entirely at your discretion. Consider how you can display the information
clearly and visually.

* The site is expected to be accessed primarily by mobile devices but should support all major browsers.


## Challenge

* Required
- Build and host a web application that uses the OpenWeatherMap API (sign up to access the API) to retrieve and display current weather information for a user-entered location.
- The information shown must include: current weather, temperature, sunrise and sunset times.
- The application must be resilient and user-communicative regarding errors.
- Ensure that the application meets basic accessibility criteria, and uses good semantic HTML.

* Stretch
- Display the remaining information from the API call: visibility, wind, humidity, etc.
- Provide some personalisation settings. Preferred units (°C/°F), for example.
- Store and recall these settings from local storage, as well as the user’s recently entered locations.
- Add appropriate tests to suit the scenario.


## Installation

* To clone the repo:
```shell
$ git clone https://github.com/Clifford2910/weatherapp-rails.git
$ cd weatherapp-rails
```

## Usage

* To open the App:
```shell
$ rails s
```

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.


## Testing (with Rspec)

* To test the repo:
```shell
$ bundle exec rspec spec/api_spec.rb:3
```


## Image of App

<img src="app.png" />
