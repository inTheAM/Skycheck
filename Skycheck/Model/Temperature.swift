//
//  Temperature.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

struct Temperature:	Decodable	{
	let morning:	Double
	let day:	Double
	let evening: Double
	let night:	Double
	let min:	Double?
	let max:	Double?
	
	enum CodingKeys:	String, CodingKey	{
		case morning = "morn",
			 day,
			 night,
			 evening = "eve",
			 min,
			 max
	}
}
