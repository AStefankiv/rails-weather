# require 'net/http'

# class HomeController < ApplicationController
#   def index
#     # render 'index'
#     url = "https://api.openweathermap.org/data/2.5/weather?lat=51.049999&lon=-114.066666&units=metric&appid=5d03de9143d8f66e4da9cd4ff4be7cfc"
#     uri = URI(url)
#     response = Net::HTTP.get_response(uri)
#     @data = JSON.parse(response.body)
#   end
# end


require 'net/http'

class HomeController < ApplicationController
  def index
    @city = params[:city]&.titleize || "calgary"
    apiKey = "5d03de9143d8f66e4da9cd4ff4be7cfc"
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=metric&appid=#{apiKey}"
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    @data = JSON.parse(response.body)
  end

  def searching
    @city = params[:city]&.titleize
    redirect_to action: "index", city: @city
  end

end