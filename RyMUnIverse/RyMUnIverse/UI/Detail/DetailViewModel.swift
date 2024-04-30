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
    private var dataManager: DetailDataManager
    var cancellables: Set<AnyCancellable> = []
    
    init(dataManager: DetailDataManager, model: Character) {
        self.dataManager = dataManager
        self.model = model
    }
    
    // MARK: - Public Method -
    
}
