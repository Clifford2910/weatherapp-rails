class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://api.openweathermap.org/data/2.5/weather?q=london&appid=80a15e8248942ae6b85511e693c86fc4'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @data = JSON.parse(@response)
  end
end
