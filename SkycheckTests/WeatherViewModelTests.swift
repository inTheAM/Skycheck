//
//  WeatherViewModelTests.swift
//  SkycheckTests
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import XCTest
@testable import Skycheck

class WeatherViewModelTests: XCTestCase {
	var viewModel:	WeatherViewModel!
	var mockWeatherService:	MockWeatherService!
	
    override func setUp()  {
        viewModel	=	WeatherViewModel()
		mockWeatherService	=	MockWeatherService()
    }

    override func tearDownWithError() throws {
        viewModel	=	nil
		mockWeatherService	=	nil
    }

	func testViewModelIsUpdatedWithCorrectDetails()	{
		viewModel.loadWeather()
		XCTAssertEqual(viewModel.city, "Mombasa")
	}


}
