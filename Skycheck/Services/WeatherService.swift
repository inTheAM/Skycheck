//
//  WeatherService.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation
import CoreLocation

protocol WeatherServiceProtocol {
	func fetchWeather(forLocation location:	Location, completion:	@escaping (Result<(Weather, Location), FetchingError>) ->	Void)
}

struct WeatherService	{
	private let apiKey	=	"API_KEY"
}

extension WeatherService:	WeatherServiceProtocol	{
	func fetchWeather(forLocation location:	Location, completion:	@escaping (Result<(Weather, Location), FetchingError>) ->	Void)	{
		guard let urlString	=	"https://api.openweathermap.org/data/2.5/onecall?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&exclude=minutely,alerts&appid=\(apiKey)&units=\(Locale.measurementSystem)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)	else {
			completion(.failure(.invalidURL))
			return
		}
		NetWorkManager.makeRequest(Weather.self, urlString: urlString) { result in
			switch result	{
			case .success(let weather):
				completion(.success((weather, location)))
				
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
	
}



