//
//  HomeViewModel.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: - Properties -
    private let characterUseCase: CharacterUseCase
    private let searchUseCase: SearchUseCase
    var cancellables: Set<AnyCancellable> = .init()
    @Published var charactersForView: Characters = .init()
    
    init(characterUseCase: CharacterUseCase,
         searchUseCase: SearchUseCase) {
        self.characterUseCase = characterUseCase
        self.searchUseCase = searchUseCase
    }
    
    // MARK: - Public Method -
    func getAllCharacters() {
        characterUseCase.get()
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.charactersForView = []
                }
            } receiveValue: { [weak self] characters in
                self?.charactersForView.append(contentsOf: characters)
            }.store(in: &cancellables)
    }
    
    func getCharactersListBySearch(parameter: String) {
        searchUseCase.getBy(name: parameter)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.charactersForView = []
                }
            } receiveValue: { [weak self] characters in
                self?.charactersForView = characters
            }.store(in: &cancellables)
    }
}
