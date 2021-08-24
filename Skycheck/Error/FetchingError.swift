//
//  FetchingError.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import Foundation

enum FetchingError:	Error	{
	case invalidURL,
		 noDataFromServer,
		 failedToDecodeData
	
}
