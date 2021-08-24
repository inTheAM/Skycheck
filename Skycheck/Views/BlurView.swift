//
//  BlurView.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 18/08/2021.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
	let style: UIBlurEffect.Style = .systemThinMaterialDark
	
	func makeUIView(context: Context) -> UIVisualEffectView {
		return UIVisualEffectView(effect: UIBlurEffect(style: style))
	}
	func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
		uiView.effect = UIBlurEffect(style: style)
	}
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
