//
//  HomeViewModel.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    private var dataManager: HomeDataManager
    var cancellables: Set<AnyCancellable> = []

    init(dataManager: HomeDataManager) {
        self.dataManager = dataManager
    }

    func createCharacters() {
        dataManager.createCharacters()
            .sink { [weak self] completion in
                print(completion)
            if case let .failure(error) = completion {
                print("Error \(error)")
            }
        } receiveValue: { data in
//TODO: use data
        }.store(in: &cancellables)
    }
}
