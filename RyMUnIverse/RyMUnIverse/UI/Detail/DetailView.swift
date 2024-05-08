//
//  DetailView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties -
    @ObservedObject var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        appMainBackground {
            VStack {
                CharacterHeaderView(name: viewModel.model.name,
                                    image: viewModel.model.image)
                EpisodesListView(episodes: viewModel.episodesModel)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackArrow())
        }
        // MARK: - Lifecycle -
            .onAppear {
                viewModel.getEpisodes()
            }
    }
}
