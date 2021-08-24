//
//  SearchResultView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 18/08/2021.
//

import SwiftUI

struct SearchResultView: View {
	let location:	Location
	@State private var showSheet = false
    var body: some View {
		HStack	{
			Button(action: {showSheet = true})	{
			Text(location.city + ", " + location.country)
				.foregroundColor(.white)
			Spacer()
			}.padding()
		}
		.overlayBottomDivider()
		.sheet(isPresented: $showSheet) {
			WeatherView(location: location, isExpanded: true, showCollapse: false)
				.ignoresSafeArea()
		}
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//		SearchResultView(location: .example)
//    }
//}
