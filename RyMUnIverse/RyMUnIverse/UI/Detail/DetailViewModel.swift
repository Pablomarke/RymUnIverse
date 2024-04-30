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
    private var dataManager: DetailDataManager
    var cancellables: Set<AnyCancellable> = []
    
    init(dataManager: DetailDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Public Method -
    
}
