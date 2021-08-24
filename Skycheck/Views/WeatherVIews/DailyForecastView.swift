//
//  DailyForecastView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 19/08/2021.
//

import SwiftUI

struct DailyForecastView: View {
	let dailyForecasts: [DailyForecastViewModel]
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false)	{
			HStack(spacing: 30)	{
				ForEach(dailyForecasts)	{ forecast in
					VStack(alignment: .leading, spacing: 5)	{
						Text(forecast.day)
							.bold()
						
						HStack	{
							
							Text(forecast.description)
							Image(systemName: forecast.icon)
								.renderingMode(.original)
								.frame(minWidth: 20, minHeight: 40)
						}
						HStack	{
							
							Text(forecast.chanceOfRain)
								.bold()
								.foregroundColor(.white)
							Image(systemName: "umbrella.fill")
								.font(.caption)
								.foregroundColor(.init(red: 137/255, green: 230/255, blue: 254/255))
								.rotationEffect(Angle(degrees: 30))
						}
						
						Text("\(forecast.minTemperature) - \(forecast.maxTemperature)")
					}
				}
			}.padding()
		}
    }
}

//struct DailyForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyForecastView()
//    }
//}
