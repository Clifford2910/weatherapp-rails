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
    split_data(data)
  end

  def split_data(data)
    name(data)
    weather(data)
    main(data)
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
end
