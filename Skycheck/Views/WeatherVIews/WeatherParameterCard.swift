//
//  WeatherParameterCard.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 19/08/2021.
//

import SwiftUI

struct WeatherParameterCard: View {
	let image:	String
	let value:	String
	let label: 	String
    var body: some View {
		VStack	{
			Text(value)
				.font(.caption)
				.padding(.bottom, 2)
			Image(systemName: image)
				.foregroundColor(.white)
				.frame(width: 20, height: 20)
			Text(label)
				.font(.caption2)
				.bold()
		}.padding(10)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.white.opacity(0.1).cornerRadius(10))
    }
}

struct WeatherParameterCard_Previews: PreviewProvider {
    static var previews: some View {
		WeatherParameterCard(image: "", value: "", label: "")
    }
}
