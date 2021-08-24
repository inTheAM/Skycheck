//
//  CondensedWeatherView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 22/08/2021.
//

import SwiftUI

struct CondensedWeatherView: View {
	@ObservedObject var weatherViewModel: WeatherViewModel
	@EnvironmentObject var repository: Repository
	var namespace: Namespace.ID
    var body: some View {
		ZStack	{
			LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
				.ignoresSafeArea()
			BlurView()
				.opacity(0.6)
			HStack(alignment: .bottom)	{
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
					Spacer()
					HStack(alignment: .center)	{
						Text(weatherViewModel.weatherDescription)
						
						if !weatherViewModel.icon.isEmpty	{
							Image(systemName: weatherViewModel.icon)
								.renderingMode(.original)
						}
					}.matchedGeometryEffect(id: "description", in: namespace)
				}
				Spacer()
				VStack(alignment: .trailing)	{
					Text(weatherViewModel.temperature)
						.font(.system(size: 80).weight(.ultraLight))
						.padding(-2)
						.matchedGeometryEffect(id: "temp", in: namespace)
				}
			}.foregroundColor(.white)
			.padding()
			
		}
    }
}

//struct CondensedWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        CondensedWeatherView()
//    }
//}
