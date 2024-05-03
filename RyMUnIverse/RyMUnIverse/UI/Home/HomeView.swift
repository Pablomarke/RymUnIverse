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
                    Text("Rick y Morty")
                        .font(.custom("Get Schwifty", size: 40))
                        .foregroundStyle(Color.white)
                        .padding()
                    SearchBar(text: $searchText)
                    List(content: {
                        ForEach(viewModel.charactersForView) { character in
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
        }
    // MARK: - Lifecycle -
        .onAppear {
            viewModel.getAllCharacters()
        }
        
        .onChange(of: searchText) { newValue in
            viewModel.getCharactersListBySearch(parameter: newValue)
        }
    }
}

#Preview {
    HomeWireframe.createView()
}
