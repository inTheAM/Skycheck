//
//  SearchViewModel.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 18/08/2021.
//

import Foundation
import CoreLocation
import Combine

final class SearchViewModel:	ObservableObject	{
	@Published var locations	=	[Location]()
	@Published var searchTerm	=	""
	@Published var searchResultsMessage	=	""
	@Published var isSearching	=	false
	
	private let locationService:	LocationServiceProtocol
	
	private var locationSearchCancellable:	AnyCancellable?	=	nil
	private var searchResultsCancellable:	AnyCancellable?	=	nil
		
	init(locationService:	LocationServiceProtocol = LocationService.shared)	{
		self.locationService	=	locationService
		
		locationSearchCancellable	=	$searchTerm
			.dropFirst()
			.debounce(for: 0.5, scheduler: RunLoop.main)
			.removeDuplicates()
			.sink { term in
				self.search(term)
			}
		
		searchResultsCancellable	=	$locations
			.dropFirst()
			.debounce(for: 0.5, scheduler: RunLoop.main)
			.map	{
				$0.isEmpty ?  "No results" :  ""
			}
			.sink	{ message in
				DispatchQueue.main.async {
					self.searchResultsMessage	= message
				}
			}
	}
	
	func search(_ searchTerm:	String)	{
		self.isSearching	=	true
		locationService.getLocationsNamed(searchTerm) { [weak self] result in
			DispatchQueue.main.async {
				switch result	{
				case .success(let fetchedLocations):
					self?.locations	=	fetchedLocations
					self?.isSearching	=	false
					
				case .failure:
					self?.locations.removeAll(keepingCapacity: true)
					self?.isSearching	=	false
				}
				
			}
		}
	}
}
