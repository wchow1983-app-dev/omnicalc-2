class CoordinatesController < ActionController::Base
  layout("application.html.erb")

  def street_form
    render ({:template => "/coordinates_templates/street_form.html.erb"})
  end

  def coordinates_form
    render ({:template => "/coordinates_templates/coordinates_form.html.erb"})
  end

  def weather_form
    render ({:template => "/coordinates_templates/weather_form.html.erb"})
  end


  #get("/street_to_weather/results", { :controller => "coordinates", :action => "weather_result" })

  def street_result
    @street_address = params.fetch("street_address")

    @raw_data = open("https://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}&key="+ENV.fetch("GMAPS_KEY")).read
    @parsed_data = JSON.parse(@raw_data)

    @results_key_array = @parsed_data.fetch("results").at(0)
    @latitude_results = @results_key_array.fetch("geometry").fetch("location").fetch("lat")
    @longitude_results = @results_key_array.fetch("geometry").fetch("location").fetch("lng")

    render ({:template => "/coordinates_templates/street_result.html.erb"})
  end

  def coordinates_result
    @latitude = params.fetch("latitude")
    @longitude = params.fetch("longitude")

    @raw_data = open("https://api.darksky.net/forecast/"+ENV.fetch("DARK_SKY_KEY")+"/#{@latitude},#{@longitude}").read
    @parsed_data = JSON.parse(@raw_data)

    @currently_temperature_hash = @parsed_data.fetch("currently").fetch("temperature")
    @currently_summary_hash = @parsed_data.fetch("currently").fetch("summary")

    @minutely_summary_hash = @parsed_data.fetch("minutely").fetch("summary")
    @hourly_summary_hash = @parsed_data.fetch("hourly").fetch("summary")
    @daily_summary_hash = @parsed_data.fetch("daily").fetch("summary")

    render ({:template => "/coordinates_templates/coordinates_result.html.erb"})
  end

  def weather_result
  #Part 1 - Getting the latitude and longitude using an address
    @street_address = params.fetch("street_address")

    @raw_data = open("https://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}&key="+ENV.fetch("GMAPS_KEY")).read
    @parsed_data = JSON.parse(@raw_data)

    @results_key_array = @parsed_data.fetch("results").at(0)
    @latitude_results = @results_key_array.fetch("geometry").fetch("location").fetch("lat")
    @longitude_results = @results_key_array.fetch("geometry").fetch("location").fetch("lng")
    
  #part 2 - Getting the weather results using the latitude and longitude 
    @raw_data = open("https://api.darksky.net/forecast/"+ENV.fetch("DARK_SKY_KEY")+"/#{@latitude_results},#{@longitude_results}").read
    @parsed_data = JSON.parse(@raw_data)

    @currently_temperature_hash = @parsed_data.fetch("currently").fetch("temperature")
    @currently_summary_hash = @parsed_data.fetch("currently").fetch("summary")

    @minutely_summary_hash = @parsed_data.fetch("minutely").fetch("summary")
    @hourly_summary_hash = @parsed_data.fetch("hourly").fetch("summary")
    @daily_summary_hash = @parsed_data.fetch("daily").fetch("summary")

    render ({:template => "/coordinates_templates/weather_result.html.erb"})
  end
end