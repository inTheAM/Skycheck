//
//  LocationError.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation


enum LocationError:	Error	{
	case failedToLocateUser,
		 searchTermTooShort,
		 failedToLoadPlaces,
		 failedToLoadLocationDetails
}
