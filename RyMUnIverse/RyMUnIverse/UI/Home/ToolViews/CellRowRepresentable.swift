//
//  CellRowRepresentable.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 29/4/24.
//

import SwiftUI
import Kingfisher

struct CellRowRepresentable: View {
    var model: CellRepresentable
    
    var body: some View {
        HStack {
            KFImage(URL(string: model.image))
                .resizable()
                .frame(width: 120,
                       height: 120)
                .background(.clear)
                .clipShape(Circle())
            Text(model.name)
        }
    }
}
