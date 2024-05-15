//
//  HeaderTextView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 3/5/24.
//

import SwiftUI

struct HeaderTextView: View {
    var body: some View {
        Text("Rick y Morty")
            .font(.custom("Get Schwifty", size: 40))
            .foregroundStyle(Color.white)
            .padding()
    }
}

#Preview {
    HeaderTextView()
}
