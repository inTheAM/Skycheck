//
//  HomeView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 21/08/2021.
//

import SwiftUI

struct HomeView: View {
	@StateObject var homeViewModel = HomeViewModel()
	@EnvironmentObject var repository: Repository
	@State private var showSearchView = false
	@State private var isEditing = false
	
	var body: some View {
		ZStack	{
			Color.black.ignoresSafeArea()
			VStack	{
				HStack	{
					Button(action:	toggleEditingMode)	{
						Image(systemName: "square.and.pencil")
							.font(.title)
							.foregroundColor(.blue)
							.padding(5)
					}
					Spacer()
					Button(action:	activateSearch)	{
						Image(systemName: "plus.square")
							.font(.title)
							.foregroundColor(.blue)
							.padding(5)
					}
				}.padding([.horizontal])
				ScrollView	{
					VStack	{
						VStack(spacing: 0)	{
							ForEach(homeViewModel.locations)	{ location in
								WeatherView(location: location).equatable()
							}
							ForEach(repository.savedLocations)	{ location in
								HStack	{
									WeatherView(location: location).equatable()
									DeleteButton(isEditing: $isEditing, location: location) {
										repository.removeLocation(location)
									}
								}
							}
							
						}.cornerRadius(10)
					}
				}
			}
		
		}.animation(.spring())
		.onAppear	{
			homeViewModel.locateUser()
			repository.retrieve()
		}
		.sheet(isPresented: $showSearchView) {
			SearchView(showingView: $showSearchView)
				.environmentObject(repository)
		}
	}
	
	private func activateSearch()	{
		withAnimation	{
			showSearchView = true
		}
	}
	private func toggleEditingMode()	{
		withAnimation	{
			isEditing.toggle()
		}
	}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
