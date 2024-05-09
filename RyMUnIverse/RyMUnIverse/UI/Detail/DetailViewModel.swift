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
    @Published var episodesModel: Episodes = []
    private let detailUseCase: DetailUseCase
    var cancellables: Set<AnyCancellable> = []
    
    init(model: Character, detailUseCase: DetailUseCase) {
        self.model = model
        self.detailUseCase = detailUseCase
    }
    
    // MARK: - Public Method -
    func getEpisodes() {
        for episode in model.episode {
            detailUseCase.getDetail(relativePath: episode)
                .sink { [weak self] completion in
                    if case let .failure(error) = completion {
                        self?.episodesModel = []
                    }
                } receiveValue: { [weak self] episode in
                    self?.episodesModel.append(episode)
                }.store(in: &cancellables)
        }
    }
}
