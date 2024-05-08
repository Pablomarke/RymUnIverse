//
//  EpisodesListView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 8/5/24.
//

import SwiftUI

struct EpisodesListView: View {
    var episodes: Episodes
    
    var body: some View {
        Text("Episodes")
            .padding(.leading)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .foregroundStyle(Color.white)
            .font(.title)
        List {
            ForEach(episodes,
                    id: \.self) { episode in
                Text(episode.name)
            }
                    .padding(.top)
        }
        .listStyle(PlainListStyle())
    }
}
