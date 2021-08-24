//
//  Location.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 18/08/2021.
//

import Foundation
import CoreLocation

struct Location	{
	let city:	String
	let country: String
	let coordinate:	CLLocationCoordinate2D
}

extension Location: Identifiable	{
	var id: String	{
		(city + country).lowercased()
	}
}

extension Location:	Equatable	{
	static func == (lhs: Location, rhs: Location) -> Bool {
		lhs.city == rhs.city	&& lhs.country	==	rhs.country
	}
}

extension Location: Codable	{
	private var latitude: Double	{
		coordinate.latitude
	}
	private var longitude: Double	{
		coordinate.longitude
	}
	enum CodingKeys: CodingKey	{
		case city, country, latitude, longitude
	}
	func encode(to encoder: Encoder) throws {
		var container    =    encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(city, forKey: .city)
		try container.encode(country, forKey: .country)
		try container.encode(latitude, forKey: .latitude)
		try container.encode(longitude, forKey: .longitude)
	}
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		city = try container.decode(String.self, forKey: .city)
		country = try container.decode(String.self, forKey: .country)
		let latitude = try container.decode(Double.self, forKey: .latitude)
		let longitude = try container.decode(Double.self, forKey: .longitude)
		coordinate	=	CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}

extension Location	{
	static let example	=	Location(city: "Mombasa", country: "Kenya", coordinate: CLLocationCoordinate2D(latitude: -4.038616180419922, longitude: 39.65884304011829))
}
