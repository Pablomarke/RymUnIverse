//
//  HomeWireframe.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import SwiftUI

enum HomeWireframe {
    static func createView() -> some View {
        let dataSource: CharactersDataSource = CharactersDatasourceImpl(apiClient: URLSessionAPIClient())
        let repository: CharacterListRepository = CharacterListRepositoryImpl(charactersDataSource: dataSource)

        let characterUseCase: CharacterUseCase = CharacterUseCaseImpl(characterRepository: repository)
        let searchUseCase: SearchUseCase = SearchUseCaseImpl(characterRepository: repository)
        
        let viewModel: HomeViewModel = .init(characterUseCase: characterUseCase,
                                             searchUseCase: searchUseCase)
        let view = HomeView(viewModel: viewModel)
        
        return view
    }
}
