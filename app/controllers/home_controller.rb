require 'net/http'

class HomeController < ApplicationController
  def index
    @city = params[:city]&.titleize || "calgary"
    apiKey = "5d03de9143d8f66e4da9cd4ff4be7cfc"
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=metric&appid=#{apiKey}"
    uri = URI(url)
    puts 'url: ' + url.to_s
    puts 'uri: ' + uri.to_s
    response = Net::HTTP.get_response(uri)
    puts 'response: ' + response.to_s
    @data = JSON.parse(response.body)
    puts 'data: ' + @data.to_s
  end

  def searching
    @city = params[:city]&.titleize
    redirect_to action: "index", city: @city
  end

end