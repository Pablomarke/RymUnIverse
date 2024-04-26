//
//  HomeView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties -
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View -
    var body: some View {
        List(content: {
            ForEach(viewModel.charactersForView) { data in
                    Text(data.name)
                }
        })
        // MARK: - Lifecycle -
            .onAppear {
                viewModel.createCharacters()
            }
    }
}

#Preview {
    HomeWireFrame().view
}
