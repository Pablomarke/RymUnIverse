//
//  HomeWireframe.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import SwiftUI

enum HomeWireframe {
    static func createView() -> some View {
        let characterUseCase: CharacterUseCase = CharacterUseCaseImpl()
        let searchUseCase: SearchUseCase = SearchUseCaseImpl()
        let viewModel: HomeViewModel = .init(characterUseCase: characterUseCase,
                                             searchUseCase: searchUseCase)
        let view = HomeView(viewModel: viewModel)
        
        return view
    }
}
