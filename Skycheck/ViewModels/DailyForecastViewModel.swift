//
//  DailyForecastViewModel.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 23/08/2021.
//

import Foundation

struct DailyForecastViewModel: Identifiable	{
	let id = UUID()
	let day: String
	let maxTemperature: String
	let minTemperature: String
	let chanceOfRain: String
	let description: String
	let icon: String
}
