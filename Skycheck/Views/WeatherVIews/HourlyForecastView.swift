//
//  HourlyForecastView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 19/08/2021.
//

import SwiftUI

struct HourlyForecastView: View {
	let hourlyForecast:	[HourlyForecastViewModel]
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators:	false)	{
			HStack(alignment: .top, spacing: 10)	{
				ForEach(hourlyForecast)	{ forecast in
					VStack(alignment: .center, spacing: 10)	{
						Text(forecast.hour)
							.font(.caption.weight(forecast.hour	==	"Now" ? .bold : .regular))
							.layoutPriority(1)
						Image(systemName: forecast.icon)
							.renderingMode(.original)
							.frame(minWidth: 20, minHeight: 40)
						Text(forecast.temperature)
					}.frame(minWidth: 40)
				}
			}.padding()
			
		}.overlayBottomDivider()
    }
}


//struct HourlyForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//		HourlyForecastView(hourlyForecast: [.example])
//    }
//}
