//
//  HomeWireframe.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import SwiftUI

final class HomeWireFrame {
    //MARK: Public Methods
    var view: AnyView {
        let apiClient: HomeApiClient = HomeApiClient()
        let dataManager: HomeDataManager = createDataManager(apiClient: apiClient)
        let viewModel: HomeViewModel = createViewModel(with: dataManager)
        let view = HomeView(viewModel: viewModel)
        
        return AnyView(view)
    }
    
    // MARK: - Private methods
    private func createDataManager(apiClient: HomeApiClient) -> HomeDataManager {
        let dataManager = HomeDataManager(apiClient: apiClient)
        return dataManager
    }
    
    private func createViewModel(with dataManager: HomeDataManager) -> HomeViewModel {
        return HomeViewModel(dataManager: dataManager)
    }
}
