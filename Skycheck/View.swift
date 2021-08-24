//
//  View.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 18/08/2021.
//

import SwiftUI

extension View {
	func placeholder<Content: View>(
		when shouldShow: Bool,
		alignment: Alignment = .leading,
		@ViewBuilder placeholder: () -> Content) -> some View {

		ZStack(alignment: alignment) {
			placeholder().opacity(shouldShow ? 1 : 0)
			self
		}
	}
	
	func overlayBottomDivider()	->	some View	{
		return self.overlay(Divider().overlay(Color.white.opacity(0.8)), alignment: .bottom)
	}
}

extension View  {
	func tabBarHidden() ->  some View  {
		UITabBarController().tabBar.isHidden = true
		return self
	}
}
