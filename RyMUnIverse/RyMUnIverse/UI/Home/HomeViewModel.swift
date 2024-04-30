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
    var cancellables: Set<AnyCancellable> = []
    @Published var charactersForView: Characters = []
    
    init(characterUseCase: CharacterUseCase) {
        self.characterUseCase = characterUseCase
    }
    
    // MARK: - Public Method -
    func getAllCharacters() {
        characterUseCase.get()
            .sink { completion in
                if case let .failure(error) = completion {
                   //TODO: error implemented
                    print("Error \(error)")
                }
            } receiveValue: { [weak self] characters in
                self?.charactersForView.append(contentsOf: characters)
            }.store(in: &cancellables)
    }
    
    func getCharactersListBySearch(parameter: String) {
        characterUseCase.getBy(name: parameter)
            .sink { completion in
                if case let .failure(error) = completion {
                    //TODO: error implemented
                    print("Error \(error)")
                }
            } receiveValue: { [weak self] characters in
                self?.charactersForView = characters
            }.store(in: &cancellables)
    }
}
