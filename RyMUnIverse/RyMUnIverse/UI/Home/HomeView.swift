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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // MARK: - Lifecycle -
            .onAppear {
                viewModel.createCharacters()
            }
    }
}

#Preview {
    HomeWireFrame().view
}
