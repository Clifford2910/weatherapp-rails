class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index; end

  def search
    city = params[:query]
    pull_api_data_and_parse(city)
    render :index
  end

  private

  def pull_api_data_and_parse(city)
    api_key = ENV['WEATHER_API_KEY']
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    handle_errors(data)
  end

  def handle_errors(data)
    if data['id']
      split_data(data)
    else
      flash.now[:alert] = 'Could not find location, please check spelling and try again.'
    end
  end

  def split_data(data)
    name(data)
    weather(data)
    main(data)
    sunrise_sunset(data)
    minor(data)
    time_at_location(data)
  end

  def name(data)
    @city = data['name']
  end

  def weather(data)
    @weather = data['weather'][0]['main']
    @description = data['weather'][0]['description']
  end

  def main(data)
    @temperature = data['main']['temp'].round
    @temp_min = data['main']['temp_min'].round
    @temp_max = data['main']['temp_max'].round
    @pressure = data['main']['pressure'].round
    @humidity = data['main']['humidity'].round
  end

  def sunrise_sunset(data)
    sunrise = Time.at(data['sys']['sunrise']).utc + data['timezone'].seconds
    sunset = Time.at(data['sys']['sunset']).utc + data['timezone'].seconds

    @sunrise = sunrise.to_s(:time)
    @sunset = sunset.to_s(:time)
  end

  def minor(data)
    @visibility = data['visibility']
    @wind_speed = data['wind']['speed'].round
  end

  def time_at_location(data)
    time_at_location = Time.now.utc + data['timezone'].seconds if data['timezone'].seconds
    @time_at_location = time_at_location.to_s(:time)
  end
end
