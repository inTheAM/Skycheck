//
//  MainViewModel.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 21/08/2021.
//

import Foundation
import CoreLocation

final class HomeViewModel: NSObject, ObservableObject	{
	private let locationService: LocationServiceProtocol
	private let repository: RepositoryProtocol
	
	@Published var locations = [Location]()
	
	init(repository: RepositoryProtocol = Repository.shared, locationService: LocationServiceProtocol	=	LocationService.shared)	{
		self.locationService = locationService
		self.repository = repository
		super.init()
		self.locationService.assignDelegate(self)
	}
}


extension	HomeViewModel:	CLLocationManagerDelegate	{
	
	func locateUser()	{
		locationService.locateUser()
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		locationService.fetchUserLocationDetails(completion: { [weak self] result in
			if case .success(let location) = result	{
				self?.locations = [location]
				self?.repository.setCurrentLocation(to: location)
				self?.locationService.stopUpdates()
			}
		})
	}
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error)
	}
}
