//
//  DetailViewModel.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var model: Character
    private let detailUseCase: DetailUseCase
    var cancellables: Set<AnyCancellable> = []
    
    init(model: Character, detailUseCase: DetailUseCase) {
        self.model = model
        self.detailUseCase = detailUseCase
    }
    
    // MARK: - Public Method -
    func getCharacter() {
        detailUseCase.getDetail()
            .sink { completion in
                if case let .failure(error) = completion {
                    //TODO: error implemented
                    print("Error \(error)")
                }
            } receiveValue: { [weak self] character in
                //TODO: Implement
                self?.model = character
            }.store(in: &cancellables)
    }
}
