//
//  HourlyForecastViewModel.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 19/08/2021.
//

import SwiftUI


struct HourlyForecastViewModel: Identifiable	{
	init(forecastTime: Date, hour: String, temperature: String, chanceOfRain: String, description: String, icon: String) {
		self.forecastTime = forecastTime
		self.hour = hour
		self.temperature = temperature
		self.chanceOfRain = chanceOfRain
		self.description = description
		self.icon = icon
	}
	
	let id	=	UUID()
	
	let forecastTime:	Date
	
	let hour:	String
	var temperature:	String
	var chanceOfRain:	String
	var description:	String
	let icon:	String
	
//	static let example	=	HourlyForecastViewModel(forecast: .example)
}
