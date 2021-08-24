//
//  SearchView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 18/08/2021.
//

import SwiftUI

struct SearchView: View {
	@StateObject var searchViewModel	=	SearchViewModel()
	@Binding var showingView:	Bool
    var body: some View {
		ZStack	{
			BlurView()
				.edgesIgnoringSafeArea(.all)
			
			VStack	{
				VStack	{
					Text("Enter city")
						.foregroundColor(.white)
					HStack	{
						TextField("", text: $searchViewModel.searchTerm)
							.foregroundColor(.white)
							.placeholder(when: searchViewModel.searchTerm.isEmpty) {
								Text("\(Image(systemName:	"magnifyingglass")) Search").foregroundColor(.gray)
							}
							.padding(10)
							.background(Color.black.opacity(0.2))
							.cornerRadius(10)
						
						Button(action:    {
							withAnimation {
								showingView	=	false
							}
						})    {
							Text("Cancel")
								.font(.title3)
								.foregroundColor(.white)
						}.padding(.vertical, 10)
					}
				}.padding()
				
				.overlayBottomDivider()
				
					ScrollView	{
						if searchViewModel.isSearching	{
							ProgressView()
						}	else	{
						VStack	{
							if searchViewModel.locations.isEmpty	{
								Text(searchViewModel.searchResultsMessage)
									.foregroundColor(.white)
							}	else	{
								ForEach(searchViewModel.locations)	{ location in
									SearchResultView(location: location)
								}
							}
						}
					}
				}
			}
		}.transition(.move(edge: .bottom))
		
		
    }
}






//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//		SearchView(showingView: .constant(true))
//    }
//}
