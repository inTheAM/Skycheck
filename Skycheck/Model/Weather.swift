//
//  Weather.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

struct Weather:	Decodable	{
	let utcOffset:	Double
	let current:	CurrentData
	let hourlyForecasts:	[HourlyForecast]
	let dailyForecasts:	[DailyForecast]
	
	enum CodingKeys: String, CodingKey	{
		case current,
			 hourlyForecasts = "hourly",
			 dailyForecasts = "daily",
			 utcOffset = "timezone_offset"
	}
}
