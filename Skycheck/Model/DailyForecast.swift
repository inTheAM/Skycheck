//
//  DailyForecast.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

struct DailyForecast:	Decodable	{
	let time:	Double
	let sunrise: Double
	let sunset:	Double
	let moonrise:	Double
	let moonset:	Double
	let moonPhase:	Double
	let temperature:  Temperature
	let feelsLikeTemperature:	Temperature
	let cloudCover:	Double
	let pressure:	Double
	let humidity:	Double
	let uvIndex:	Double
	let windSpeed:	Double
	let windDirection:	Int
	let chanceOfRain:	Double
	let descriptions:	[WeatherDescription]
	
	enum CodingKeys:	String, CodingKey	{
		case time = "dt",
			 sunrise,
			 sunset,
			 moonrise,
			 moonset,
			 moonPhase = "moon_phase",
			 temperature = "temp",
			 feelsLikeTemperature = "feels_like",
			 cloudCover = "clouds",
			 pressure,
			 humidity,
			 uvIndex = "uvi",
			 windSpeed = "wind_speed",
			 windDirection = "wind_deg",
			 chanceOfRain = "pop",
			 descriptions = "weather"
	}
}
