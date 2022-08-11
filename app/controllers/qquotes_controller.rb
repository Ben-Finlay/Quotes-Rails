class QquotesController < ActionController::Base

  layout "application"

  def show
    
    @quotes = Qquotes.all
    @current_quote = @quotes.sample
    
    @city = 'Toronto'
    @api = ENV['WEATHER_KEY']
    @api_call = 'https://api.openweathermap.org/data/2.5/weather?q=' + @city + '&appid=' + @api + '&units=metric'
    @api = URI(@api_call)
    @response = Net::HTTP.get(@api)
    @json = JSON.parse(@response)
    @conditions = @json["weather"][0]["main"]
    @temp = @json["main"]["temp"]
    @temp_rnd = @temp.round()
    @icon = 'weather/wi-na.png'
    @description = @json["weather"][0]["description"]

    if @conditions == 'Clear'
      @icon = 'weather/wi-day-sunny.png'
    elsif @conditions == 'Thunderstorm'
      @icon = 'weather/wi-storm-showers.png'
    elsif @conditions == 'Drizzle'
      @icon = 'weather/wi-day-rain.png'
    elsif @conditions == 'Rain'
      @icon = 'weather/wi-showers.png'
    elsif @conditions == 'Snow'
      @icon = 'weather/wi-snow.png'
    elsif @conditions == 'Clouds'
      @icon = 'weather/wi-cloudy.png'
    elsif @conditions == 'Atmosphere' || 'Mist' || 'Smoke' || 'Haze' || 'Dust' || 'Fog' || 'Sand' || 'Ash' || 'Squal' || 'Tornado'
      @icon = 'weather/wi-fog.png'
    else
      @icon = 'weather/wi-na.png'
    
    end
  end

end
