//
//  HomeViewModel.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    private var dataManager: HomeDataManager
    
    init(dataManager: HomeDataManager) {
        self.dataManager = dataManager
    }

}
