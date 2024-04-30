//
//  DetailView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    // MARK: - Properties -
    @ObservedObject var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text(viewModel.model.name)
                .font(.title)
            KFImage(URL(string: viewModel.model.image))
                .clipShape(Circle()) 
            Spacer()
        }
    }
}
