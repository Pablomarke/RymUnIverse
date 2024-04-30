//
//  DetailView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties -
    @ObservedObject var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text("Detail")
        }
    }
}

#Preview {
    DetailWireframe().view
}
