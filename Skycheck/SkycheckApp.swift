//
//  SkycheckApp.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 17/08/2021.
//

import SwiftUI

@main
struct SkycheckApp: App {
	@ObservedObject var repository = Repository.shared
    var body: some Scene {
        WindowGroup {
            HomeView()
				.environmentObject(repository)
        }
    }
}
