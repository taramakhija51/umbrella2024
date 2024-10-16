require "http"
require "json"

puts "What city are you based in?"
location = gets
location = location.gsub(" ", "%20")
url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=AIzaSyDKz4Y3bvrTsWpPRNn9ab55OkmcwZxLOHI"
response = HTTP.get(url)
parsed_response = JSON.parse(response)
results = parsed_response.fetch("results")
components = results.at(0)
components = components.fetch("geometry")
bounds = components.fetch("bounds")
northeast = bounds.fetch("northeast")
lat = northeast.fetch("lat")
lng = northeast.fetch('lng')
pirate_weather_api_key = "3RrQrvLmiUayQ84JSxL8D2aXw99yRKlx1N4qFDUE"
pirate_url = "https://api.pirateweather.net/forecast/#{pirate_weather_api_key}/#{lat},#{lng}"
x = HTTP.get(pirate_url)
parsed_response = JSON.parse(x)
currently_hash = parsed_response.fetch("currently")
current_temp = currently_hash.fetch("temperature")
minute_hash = parsed_response.fetch("minutely")
minute_temp = minute_hash.fetch("summary")
puts "The current temperature is " + current_temp.to_s + "."
puts "The weather for the next hour is #{minute_temp}."
