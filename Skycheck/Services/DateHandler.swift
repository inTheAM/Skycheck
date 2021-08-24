//
//  DateHandler.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 22/08/2021.
//

import Foundation

struct DateHandler	{
	static let shared = DateHandler()
	private let formatter: DateFormatter
	
	private init()	{
		formatter = DateFormatter()
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		formatter.dateFormat	=	"hh a"
	}
	
	func formatDate(dateInUTC: Double, offset: Double, format: String = "hh a") -> String	{
		let date = Date(timeIntervalSince1970: dateInUTC + offset)
		formatter.dateFormat = format
		return formatter.string(from: date)
		
	}
	
}
