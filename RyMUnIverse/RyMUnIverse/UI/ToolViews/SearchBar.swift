//
//  SearchBar.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 29/4/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search...", 
                      text: $text)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 15)
        }
        .padding(.top, 10)
    }
}
