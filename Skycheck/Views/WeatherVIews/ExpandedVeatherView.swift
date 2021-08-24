//
//  ExpandedVeatherView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 22/08/2021.
//

import SwiftUI

struct ExpandedVeatherView: View {
	@ObservedObject var weatherViewModel: WeatherViewModel
	@EnvironmentObject var repository: Repository
	@Environment(\.presentationMode) var presentationMode
	@Binding var isExpanded: Bool
	var showCollapse: Bool
	var namespace: Namespace.ID
	
	var body: some View {
		ZStack	{
			LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
				.ignoresSafeArea()
			BlurView()
				.opacity(0.6)
			VStack(alignment: .leading)	{
				HStack	{
					VStack(alignment: .leading)	{
						HStack	{
							Text(weatherViewModel.city)
								.font(.largeTitle)
								.matchedGeometryEffect(id: "cityname", in: namespace)
							if repository.currentLocation == weatherViewModel.location	{
								Image(systemName: "location.fill")
									.font(.title)
									.foregroundColor(.white)
							}
						}
					}
					Spacer()
					if !showCollapse  && !repository.savedLocations.contains(weatherViewModel.location)	{
						Button("Add city")	{
							repository.addSavedLocation(weatherViewModel.location)
							presentationMode.wrappedValue.dismiss()
						}.padding(10)
						.font(.headline)
						.background(Color.white.opacity(0.2).cornerRadius(20))
					}	else if showCollapse  {
						Button("Collapse")	{
							isExpanded = false
						}.padding(10)
						.font(.headline)
						.background(Color.white.opacity(0.2).cornerRadius(20))
					}
				}.padding([.horizontal, .top])
				
				HStack(alignment: .bottom)	{
					VStack(alignment: .leading)	{
						HStack(alignment: .center)	{
							Text(weatherViewModel.weatherDescription)
							
							if !weatherViewModel.icon.isEmpty	{
								Image(systemName: weatherViewModel.icon)
									.renderingMode(.original)
							}
						}.matchedGeometryEffect(id: "description", in: namespace)
						Text(weatherViewModel.temperature)
							.font(.system(size: 80).weight(.ultraLight))
							.padding(-2)
							.matchedGeometryEffect(id: "temp", in: namespace)
						Text("Feels like \(weatherViewModel.feelsLikeTemperature)")
							.padding(.top, -5)
							.padding(.bottom, 5)
							.matchedGeometryEffect(id: "feels", in: namespace)
						HStack(alignment: .bottom, spacing: 30)	{
							Text("Hi: \(weatherViewModel.maxTemperature)")
							Text("Lo: \(weatherViewModel.minTemperature)")
						}
						.matchedGeometryEffect(id: "hilo", in: namespace)
					}
					Spacer()
					LazyVGrid(columns: [GridItem].init(repeating: GridItem(.flexible()), count: 2))	{
						WeatherParameterCard(image: "drop.triangle", value: weatherViewModel.humidity, label: "Humidity")
						WeatherParameterCard(image: "arrowtriangle.down.fill", value: weatherViewModel.pressure, label: "Pressure")
						WeatherParameterCard(image: "umbrella.fill", value: weatherViewModel.chanceOfRain, label: "Rain")
						WeatherParameterCard(image: "thermometer.sun", value: weatherViewModel.uvIndex, label: "UV Index")
					}
					
				}
				.padding([.horizontal, .bottom])
				.layoutPriority(1)
				.overlayBottomDivider()
				
				HourlyForecastView(hourlyForecast: weatherViewModel.hourlyData)
				
				DailyForecastView(dailyForecasts: weatherViewModel.dailyData)
				Spacer(minLength: 0)
				
			}.foregroundColor(.white)
		}
    }
}

//struct ExpandedVeatherView_Previews: PreviewProvider {
//	@Namespace static var namespace
//    static var previews: some View {
//		ExpandedVeatherView(weatherViewModel: WeatherViewModel(forLocation: .example), isExpanded: .constant(true), namespace: namespace)
//    }
//}
