//
//  DetailWireframe.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import SwiftUI

enum DetailWireframe {
    static func createView(model: Character) -> some View {
        let detailUseCase: DetailUseCase = DetailUseCaseImpl()
        let viewModel: DetailViewModel = .init(model: model,
                                               detailUseCase: detailUseCase)
        let view = DetailView(viewModel: viewModel)
        
        return view
    }
}
