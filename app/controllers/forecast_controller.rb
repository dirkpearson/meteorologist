require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================
url = "https://api.darksky.net/forecast/f98ddebdca9405c5d4c4e7d83f8334e8/#{@lat},#{@lng}"
parsed_data = JSON.parse(open(url).read)
current_temp = parsed_data["currently"]["temperature"]
current_summary = parsed_data["currently"]["summary"]
summary_of_next_sixty_minutes = parsed_data["minutely"]["summary"]
summary_of_next_several_hours = parsed_data["hourly"]["summary"]
summary_of_next_several_days = parsed_data["daily"]["summary"]

    @current_temperature = current_temp
    @current_summary = current_summary

    @summary_of_next_sixty_minutes = summary_of_next_sixty_minutes

    @summary_of_next_several_hours = summary_of_next_several_hours

    @summary_of_next_several_days = summary_of_next_several_days

    render("forecast/coords_to_weather.html.erb")
  end
end
