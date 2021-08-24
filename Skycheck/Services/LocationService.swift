//
//  LocationService.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol	{
	func locateUser()
	func fetchUserLocationDetails(completion:	@escaping ((Result<Location, LocationError>) ->	Void))
	func getLocationsNamed(_ name:	String, completion:	@escaping (Result<[Location], LocationError>)->Void)
	func assignDelegate<T>(_ delegate: T) where T: CLLocationManagerDelegate
	func stopUpdates()
}

final class LocationService	{
	static let shared = LocationService()
	
	private let locationManager	=	CLLocationManager()
	private var searchedLocations	=	[Location]()
	
	private init()	{
		locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
	}
	
	
}

extension LocationService:	LocationServiceProtocol	{
	func stopUpdates() {
		locationManager.stopUpdatingLocation()
	}
	func assignDelegate<T>(_ delegate: T) where T: CLLocationManagerDelegate	{
		LocationService.shared.locationManager.delegate	=	delegate.self
	}
	
	func locateUser()	{
		locationManager.requestWhenInUseAuthorization()
//		locationManager.requestAlwaysAuthorization()
		locationManager.startUpdatingLocation()
	}
	func fetchUserLocationDetails(completion:	@escaping ((Result<Location, LocationError>) ->	Void))	{
		guard let userLocation = locationManager.location	else	{
			completion(.failure(.failedToLocateUser))
			return
		}
		
		let geocoder	=	CLGeocoder()
		geocoder.reverseGeocodeLocation(userLocation) { [weak self] places, _ in
			guard let place = places?.first else	{
				completion(.failure(.failedToLoadPlaces))
				return
			}
			guard let city	=	place.locality, let country = place.country, let coordinate = place.location?.coordinate	else	{
				completion(.failure(.failedToLoadLocationDetails))
				return
			}
			let location	=	Location(city: city, country: country, coordinate: coordinate)
			
			completion(.success(location))
			
			guard let searchedLocations	=	self?.searchedLocations	else	{
				return
			}
			if !searchedLocations.contains(location)	{
				self?.searchedLocations.append(location)
			}
		}
	}
	
	func getLocationsNamed(_ name:	String, completion:	@escaping (Result<[Location], LocationError>)->Void)	{
		guard name.count	>= 2	else	{
			completion(.failure(.searchTermTooShort))
			return
		}
		
		guard !searchedLocations.contains(where: { location in
			location.city.hasPrefix(name)
		}) else	{
			let locations: [Location]	=	searchedLocations.compactMap { location in
				if location.city.hasPrefix(name)	{
					return location
				}	else	{
					return nil
				}
			}
			completion(.success(locations))
			return
		}
		
		let geoCoder	=	CLGeocoder()
		geoCoder.geocodeAddressString(name) { [weak self] places, _ in
			guard let places	=	places else {
				completion(.failure(.failedToLoadPlaces))
				return
			}
			
			let locations: [Location]	=	places.compactMap	{ place in
				
				guard let city = place.locality, let country = place.country, let coordinate = place.location?.coordinate else	{
					completion(.failure(.failedToLoadLocationDetails))
					return nil
				}
				let location	= Location(city: city, country: country,  coordinate: coordinate)
				return location
			}
			completion(.success(locations))
			
			guard let searchedLocations	=	self?.searchedLocations	else	{
				return
			}
			locations.forEach { location  in
				if !searchedLocations.contains(location)	{
					self?.searchedLocations.append(location)
				}
			}
		}
		
	}
}

