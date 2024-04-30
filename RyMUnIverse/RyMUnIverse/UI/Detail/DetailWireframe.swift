//
//  DetailWireframe.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import SwiftUI

struct DetailWireframe {
    // MARK: - Properties
    let model: Character
    
    //MARK: Public Methods
    var view: some View {
        let apiClient: DetailApiClient = DetailApiClient()
        let dataManager: DetailDataManager = createDataManager(apiClient: apiClient)
        let viewModel: DetailViewModel = createViewModel(with: dataManager)
        let view = DetailView(viewModel: viewModel)
        
        return view
    }
    
    // MARK: - Private methods
    private func createDataManager(apiClient: DetailApiClient) -> DetailDataManager {
        let dataManager = DetailDataManager(apiClient: apiClient)
        return dataManager
    }
    
    private func createViewModel(with dataManager: DetailDataManager) -> DetailViewModel {
        return DetailViewModel(dataManager: dataManager, 
                               model: self.model)
    }
}
