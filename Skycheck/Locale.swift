//
//  Locale.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

extension Locale	{
	static var measurementSystem:	String	{
		Locale.current.usesMetricSystem ? "metric" : "imperial"
	}
	
	static var temperatureSymbol:	String	{
		Locale.current.usesMetricSystem ? "ºC" : "ºF"
	}
	
}
