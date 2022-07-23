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
    @url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=80a15e8248942ae6b85511e693c86fc4"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @data = JSON.parse(@response)
  end
end
