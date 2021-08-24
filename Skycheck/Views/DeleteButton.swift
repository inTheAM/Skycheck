//
//  DeleteButton.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 23/08/2021.
//

import SwiftUI

struct DeleteButton: View	{
	@Binding var isEditing: Bool
	let location: Location
	var deleteFunction: ()->()
	
	var body: some View	{
		if isEditing	{
			Button(action: deleteFunction)	{
				Image(systemName: "minus.circle.fill")
					.font(.title)
					.foregroundColor(.red)
			}.background(Color.black.clipShape(Circle()))
		}
	}
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
		DeleteButton(isEditing: .constant(true), location: .example, deleteFunction: {})
    }
}
