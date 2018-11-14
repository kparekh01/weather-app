class WeathersController < ApplicationController

  def new
  end

  def show
  end

  def post
    zipcode = params[:zipcode]
    details = Unirest.get("https://www.zipcodeapi.com/rest/#{Rails.application.credentials.zip_code_api}/info.json/#{zipcode}/degrees").body

    @location = "#{details["city"]}, #{details["state"]}"
    lat = details["lat"]
    lng = details["lng"]

    weather = Unirest.get("https://api.darksky.net/forecast/#{Rails.application.credentials.dark_sky_api}/#{lat},#{lng}").body
    daily_temps = weather["hourly"]["data"].map{|hash| hash["temperature"].to_i}.sort

    @current_temp = weather["currently"]["temperature"] #current_temp
    @daily_high = daily_temps.last
    @daily_low = daily_temps.first
    render 'show.html.erb'
  end
end
