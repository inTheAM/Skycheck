//
//  WeatherViewModel.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

final class WeatherViewModel:	ObservableObject	{
	let location: Location
	private var utcOffset: Double?
	@Published var city	=	"--"
	@Published var country	=	"--"
	@Published var temperature	=	"--"
	@Published var feelsLikeTemperature	=	"--"
	@Published var weatherDescription	=	"--"
	@Published var icon	=	""
	@Published var maxTemperature = "--"
	@Published var minTemperature = "--"
	@Published var sunrise	=	"--"
	@Published var sunset	=	"--'"
	@Published var uvIndex = "--"
	@Published var chanceOfRain	=	"--"
	@Published var humidity = "--"
	@Published var pressure	=	"--"
	@Published var hourlyData	=	[HourlyForecastViewModel]()
	@Published var dailyData = [DailyForecastViewModel]()
	
	@Published private var sunriseTime:	Double?
	@Published private var sunsetTime:	Double?
	
	@Published var errorAlert: Alert? = nil
	
	private let weatherService:	WeatherServiceProtocol
	
	init(forLocation location: Location, weatherService:	WeatherServiceProtocol	=	WeatherService())	{
		self.weatherService	=	weatherService
		self.location	=	location
		
		weatherService.fetchWeather(forLocation: location) {  result in
			if case .success(let (weather, location)) = result	{
				
				self.setValues(weather: weather, location: location)
			}	else if case .failure = result	{
				let alert = Alert(title: "Error", message: "Unable to fetch weather data. Please try again.")
				DispatchQueue.main.async {
					self.errorAlert = alert
				}
				
			}
		}
		
	}
}
extension WeatherViewModel	{
	func setValues(weather:	Weather, location:	Location)	{
		DispatchQueue.main.async {
			self.city	=	location.city
			self.country	=	location.country
			self.temperature	= String(format: "%.0f", weather.current.temperature).appending("º")
			self.feelsLikeTemperature	= String(format: "%.0f", weather.current.feelsLikeTemperature).appending("º")
			self.chanceOfRain	=	String(format: "%.0f", weather.hourlyForecasts[0].chanceOfRain * 100).appending("%")
			self.humidity	=	String(format: "%.0f", weather.current.humidity).appending("%")
			self.uvIndex	=	"\(weather.current.uvIndex)"
			self.pressure	=	String(format: "%.2f", weather.current.pressure * 0.03).appending("Hg")
			self.utcOffset = weather.utcOffset
			self.sunriseTime	=	weather.current.sunrise
			self.sunsetTime	=	weather.current.sunset
			self.weatherDescription	=	weather.current.descriptions[0].description.capitalized
			
			if let maxTemperature = weather.dailyForecasts[0].temperature.max, let minTemperature = weather.dailyForecasts[0].temperature.min	{
				self.maxTemperature	=	String(format: "%.0f", maxTemperature).appending("º")
				self.minTemperature	=	String(format: "%.0f", minTemperature).appending("º")
			}
			
			var hourlyDataCount = 0
			self.hourlyData	=	weather.hourlyForecasts.compactMap	{ forecast in
				guard hourlyDataCount	<= 23 else	{
					return nil
				}
				let forecastTime	=	Date(timeIntervalSince1970: forecast.time + weather.utcOffset)
				
				let adjustedSunrise =	weather.current.sunrise + weather.utcOffset
				let adjustedSunset =	weather.current.sunset + weather.utcOffset
				
				let forecastTimeString	=	DateHandler.shared.formatDate(dateInUTC: forecast.time , offset: weather.utcOffset)
				let currentTimeString	=	DateHandler.shared.formatDate(dateInUTC: weather.current.time , offset: weather.utcOffset)
				
				let hour =	currentTimeString	==	forecastTimeString  	?	"Now" : forecastTimeString
				let temperature = String(format: "%.0f", forecast.temperature).appending("º")
				let rain = String(format: "%.0f", forecast.chanceOfRain * 100).appending("%")
				let description = forecast.descriptions[0].description.capitalized
				
				let icon = WeatherIcons.icon(name: description, time: forecastTime, sunrise: adjustedSunrise, sunset: adjustedSunset)
				let forecastViewModel	=	HourlyForecastViewModel(forecastTime: forecastTime, hour: hour, temperature: temperature, chanceOfRain: rain, description: description, icon: icon)
				hourlyDataCount += 1
				return forecastViewModel
			}
			var dailyDataCount = 0
			self.dailyData = weather.dailyForecasts.compactMap	{ forecast in
				let currentTimeString	=	DateHandler.shared.formatDate(dateInUTC: weather.current.time , offset: weather.utcOffset, format: "EEEE")
				let forecastDay = DateHandler.shared.formatDate(dateInUTC: forecast.time, offset: weather.utcOffset, format: "EEEE")
				
				
				let tomorrow = DateHandler.shared.formatDate(dateInUTC: weather.dailyForecasts[1].time , offset: weather.utcOffset, format: "EEEE")
				if forecastDay == currentTimeString && dailyDataCount == 0	{
					dailyDataCount += 1
					return nil
				}
				var max = ""
				var min = ""
				if let maxTemperature = forecast.temperature.max, let minTemperature = forecast.temperature.min	{
					max	=	String(format: "%.0f", maxTemperature).appending("º")
					min	=	String(format: "%.0f", minTemperature).appending("º")
				}
				let rain = String(format: "%.0f", forecast.chanceOfRain * 100).appending("%")
				let description = forecast.descriptions[0].description.capitalized
				let icon = WeatherIcons.iconNamed(description)
				let day = forecastDay == tomorrow ? "Tomorrow" : forecastDay
				let forecastViewModel = DailyForecastViewModel(day: day, maxTemperature: max, minTemperature: min, chanceOfRain: rain, description: description, icon: icon)
				dailyDataCount += 1
				return forecastViewModel
			}
			
			let icon	=	WeatherIcons.icon(name: weather.current.descriptions[0].description, sunrise: weather.current.sunrise, sunset: weather.current.sunset)
			self.icon	= icon
			
		}
	}
}





