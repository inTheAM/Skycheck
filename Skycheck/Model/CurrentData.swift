//
//  CurrentData.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

struct CurrentData:	Decodable	{
	let time:	Double
	let sunrise: Double
	let sunset:	Double
	let temperature:  Double
	let feelsLikeTemperature:	Double
	let cloudCover:	Double
	let pressure:	Double
	let humidity:	Double
	let uvIndex:	Double
	let visibility:	Double
	let windSpeed:	Double
	let windDirection:	Double
	let descriptions:	[WeatherDescription]
	
	enum CodingKeys:	String, CodingKey	{
		case time = "dt",
			 sunrise,
			 sunset,
			 temperature = "temp",
			 feelsLikeTemperature = "feels_like",
			 cloudCover = "clouds",
			 pressure,
			 humidity,
			 uvIndex = "uvi",
			 visibility,
			 windSpeed = "wind_speed",
			 windDirection = "wind_deg",
			 descriptions = "weather"
	}
}
