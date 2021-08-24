//
//  MockWeatherService.swift
//  SkycheckTests
//
//  Created by Ahmed Mgua on 17/08/2021.
//

@testable import Skycheck

final class MockWeatherService:	WeatherServiceProtocol	{
	func updateLocalWeather(completion: ((Weather) -> Void)?) {
		let response	=	Response(city: "Mombasa", weatherData: [WeatherData(description: "Broken clouds", iconName: "Cloudy")], weatherParameters: WeatherParameters(temperature: 26, feelsLikeTemp: 28, minTemp: 24, maxTemp: 27, humidity: 100))
		
		let weather	=	Weather(fromResponse: response)
		completion?(weather)
	}
}
