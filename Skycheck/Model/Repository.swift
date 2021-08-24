//
//  Repository.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 21/08/2021.
//

import Foundation
import CoreLocation

protocol RepositoryProtocol	{
	func fetchSavedLocations()	-> [Location]
	func setCurrentLocation(to location: Location)
	func addSavedLocation(_ location: Location)
}

class Repository: ObservableObject	{
	static let shared = Repository()
	@Published private(set) var savedLocations:	[Location] = []
	var currentLocation: Location?
	private init(){}
}

extension Repository: RepositoryProtocol	{
	func fetchSavedLocations()	-> [Location]	{
		retrieve()
		return savedLocations
	}
	func setCurrentLocation(to location: Location)	{
		self.currentLocation	=	location
	}
	func addSavedLocation(_ location: Location)	{
		self.savedLocations.append(location)
		save()
		
	}
	func removeLocation(_ location: Location)	{
		if let index = savedLocations.firstIndex(of: location)	{
			savedLocations.remove(at: index)
			save()
		}
	}
}

extension Repository	{
	func save()	{
		guard let savedData	=	try? JSONEncoder().encode(savedLocations) else	{
			return
		}
		UserDefaults.standard.set(savedData, forKey: "savedlocations")
	}
	
	func retrieve()	{
		guard let locations	=	UserDefaults.standard.object(forKey: "savedlocations") as? Data	else {
			return
		}
		
		guard let decodedLocations	=	try? JSONDecoder().decode([Location].self, from: locations)	else	{
			return
		}
		DispatchQueue.main.async {
			self.savedLocations = decodedLocations
		}
		
	}
}
