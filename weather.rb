require 'uri'
require 'json'
require 'net/http'

puts "Hello There! Wanna get some weather updates?"
print "Enter the location/city: "

city = gets.chomp
url = URI("https://weatherapi-com.p.rapidapi.com/forecast.json?q=#{city}&days=3")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'a384927776msh1902cde053512e1p17c7bbjsn7152894086f6'
request["X-RapidAPI-Host"] = 'weatherapi-com.p.rapidapi.com'

response = http.request(request)

if response.code.to_i == 200
  data = JSON.parse(response.body)
  
  curr_temp = data["current"]["temp_c"]
  curr_feels_temp = data["current"]["feelslike_c"]
  wind_speed = data["current"]["wind_kph"]
  humidity = data["current"]["humidity"]
  
  puts "Here is the weather info for your city: #{city}"
  puts ""
  
  puts "Current Tempreture: #{curr_temp}"
  puts "Current feels like Tempreture: #{curr_feels_temp}"
  puts "Current Wind Speed (in Kmph): #{wind_speed}"
  puts "Humidity: #{humidity}"
elsif response.code.to_i == 400
  puts "The country you are searching for is not in our records"
else
  puts "Error in getting the weather data"
end
    




