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
        appMainBackground {
            VStack {
                Text(viewModel.model.name)
                    .font(.custom("Get Schwifty", size: 40))
                    .foregroundStyle(Color.white)
                KFImage(URL(string: viewModel.model.image))
                    .clipShape(Circle())
                    .padding()
                    .fadeInAnimation()
                Text("Episodes")
                    .padding(.leading)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .foregroundStyle(Color.white)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackArrow())
        }
        // MARK: - Lifecycle -
            .onAppear {
                viewModel.getEpisodes()
            }
    }
}
