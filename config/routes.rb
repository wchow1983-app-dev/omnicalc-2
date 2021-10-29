Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/add", { :controller => "application", :action => "addition_form" })
  get("/subtract", { :controller => "application", :action => "subtraction_form" })
  get("/multiply", { :controller => "application", :action => "multiplication_form" })
  get("/divide", { :controller => "application", :action => "division_form" })

  get("/wizard_add", { :controller => "application", :action => "addition_result" })
  get("/wizard_subtract", { :controller => "application", :action => "subtraction_result" })
  get("/wizard_multiply", { :controller => "application", :action => "multiplication_result" })
  get("/wizard_divide", { :controller => "application", :action => "division_result" })

  # API section

  get("/street_to_coords/new", { :controller => "coordinates", :action => "street_form" })
  get("/coords_to_weather/new", { :controller => "coordinates", :action => "coordinates_form" })
  get("/street_to_weather/new", { :controller => "coordinates", :action => "weather_form" })


  get("/street_to_coords/results", { :controller => "coordinates", :action => "street_result" })
  get("/coords_to_weather/results", { :controller => "coordinates", :action => "coordinates_result" })
  get("/street_to_weather/results", { :controller => "coordinates", :action => "weather_result" })

  
end
