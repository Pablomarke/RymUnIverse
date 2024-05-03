//
//  CharacterListView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 3/5/24.
//

import SwiftUI

struct CharacterListView: View {
    var characters: Characters
    var body: some View {
        List(content: {
            ForEach(characters) { character in
                NavigationLink {
                    DetailWireframe.createView(model: character)
                } label: {
                    CellRowRepresentable(model: character)
                }
            }
        }
        )
        .listStyle(PlainListStyle())
        .padding(.bottom, -20)
    }
}
