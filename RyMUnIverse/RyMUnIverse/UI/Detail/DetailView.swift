//
//  DetailView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    // MARK: - Properties -
    @ObservedObject var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text(viewModel.model.name)
                .font(.largeTitle)
            KFImage(URL(string: viewModel.model.image))
                .clipShape(Circle()) 
                .padding()
           
                Text("Episodes")
                .padding(.leading)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            
            
                .font(.title)
            List {
                ForEach(viewModel.episodesModel, 
                        id: \.self) { episode in
                        Text(episode.name)
                }
                    .padding(.top)
            }
            .listStyle(PlainListStyle())
        }
        // MARK: - Lifecycle -
            .onAppear {
                viewModel.getEpisodes()
            }
    }
}
