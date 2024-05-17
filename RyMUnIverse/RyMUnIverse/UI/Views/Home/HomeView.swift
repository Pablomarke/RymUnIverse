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
    @State private var searchText = ""
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View -
    var body: some View {
        NavigationView {
            appMainBackground {
                VStack {
                    HeaderTextView()
                    SearchBar(text: $searchText)
                    CharacterListView(characters: viewModel.charactersForView)
                }
            }
        }
        // MARK: - Lifecycle -
        .onAppear {
            viewModel.getAllCharacters()
        }
        
        .onChange(of: searchText) { newValue in
            viewModel.getCharactersListBySearch(parameter: newValue)
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    HomeWireframe.createView()
}
