//
//  ContentView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import SwiftUI

struct WeatherView: View {
	@ObservedObject var weatherViewModel: WeatherViewModel
	@State var isExpanded: Bool
	@Namespace var namespace
	var showCollapseButton: Bool
	
	init(location: Location, isExpanded: Bool = false, showCollapse: Bool = true)	{
		weatherViewModel = WeatherViewModel(forLocation: location)
		self.isExpanded = isExpanded
		self.showCollapseButton = showCollapse
	}
	var body: some View {
		ZStack	{
			if isExpanded	{
				ExpandedVeatherView(weatherViewModel: weatherViewModel, isExpanded: $isExpanded, showCollapse: showCollapseButton, namespace: namespace)
			} else	{
				CondensedWeatherView(weatherViewModel: weatherViewModel, namespace: namespace)
					.onTapGesture {
						isExpanded = true
					}
			}
		}
	}
}

extension WeatherView: Equatable	{
	static func == (lhs: WeatherView, rhs: WeatherView) -> Bool {
		lhs.weatherViewModel.location == rhs.weatherViewModel.location
	}
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////		WeatherView(location: .example, isExpanded: .constant(false))
//		WeatherView(location: .example)
//    }
//}
