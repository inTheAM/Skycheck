//
//  HourlyForecast.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

struct HourlyForecast: Decodable	{
	let time:	Double
	let temperature:  Double
	let feelsLikeTemperature:	Double
	let cloudCover:	Double
	let pressure:	Double
	let humidity:	Double
	let uvIndex:	Double
	let visibility:	Double
	let windSpeed:	Double
	let windDirection:	Double
	let chanceOfRain:	Double
	let descriptions:	[WeatherDescription]
	
	enum CodingKeys:	String, CodingKey	{
		case time = "dt",
			 temperature = "temp",
			 feelsLikeTemperature = "feels_like",
			 cloudCover = "clouds",
			 pressure,
			 humidity,
			 uvIndex = "uvi",
			 visibility,
			 windSpeed = "wind_speed",
			 windDirection = "wind_deg",
			 chanceOfRain = "pop",
			 descriptions = "weather"
	}
	
	static let example	=	HourlyForecast(time: 1629529200.0, temperature: 79.63, feelsLikeTemperature: 79.63, cloudCover: 50.0, pressure: 1016.0, humidity: 75.0, uvIndex: 6.25, visibility: 10000.0, windSpeed: 11.83, windDirection: 172.0, chanceOfRain: 0.85, descriptions: [Skycheck.WeatherDescription(summary: "Rain", description: "light rain", icon: "10d")])
}
