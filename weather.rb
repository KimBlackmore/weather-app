require 'yahoo_weatherman'

puts "Where are you? (enter a location as a WOEID)"
puts "  I suggest Canberra = 1100968, or lookup your own at http://woeid.rosselliot.co.nz/ "
my_woeid = gets

client = Weatherman::Client.new
weather = client.lookup_by_woeid my_woeid


puts weather.location['city'] + ", " + weather.location['country'] 
puts

my_forecasts = weather.forecasts

for i in 0..4
	if i == 0
		day_name = "Today"
	elsif i == 1
		day_name = "Tomorrow"
	else
		day_name = my_forecasts[i]['date'].strftime("%A")
	end
	puts "#{day_name} is going to be"+
		" #{my_forecasts[i]['text'].downcase} with a low of"+
		" #{my_forecasts[i]['low']} and a high of"+
		" #{my_forecasts[i]['high']} degrees celsius."
end