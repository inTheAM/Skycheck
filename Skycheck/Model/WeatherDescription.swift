//
//  WeatherDescription.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

struct WeatherDescription:	Decodable	{
	let summary:	String
	let description:	String
	let icon:	String
	
	enum CodingKeys:	String, CodingKey	{
		case summary = "main", description, icon
	}
}
