class QquotesController < ActionController::Base

  def show
    
    @quotes = Qquotes.all
    @current_quote = @quotes.sample
    
    @api_call = 'https://api.openweathermap.org/data/2.5/weather?q=toronto&appid=4ffb93e4fcd359bd248d2fbd16596f42&units=metric'
    @api = URI(@api_call)
    @response = Net::HTTP.get(@api)
    @json = JSON.parse(@response)
    @conditions = @json["weather"][0]["main"]
    @temp = @json["main"]["temp"]
    @temp_rnd = @temp.round()
    @icon = 'weather/wi-na.png'

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
    elsif @conditions == 'Atmosphere'
      @icon = 'weather/wi-fog.png'
    elsif @conditions == 'Clouds'
      @icon = 'weather/wi-cloudy.png'
    else
      @icon = 'weather/wi-na.png'
    
    end
  end

end
