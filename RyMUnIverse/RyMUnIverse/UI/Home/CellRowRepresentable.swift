//
//  CellRowRepresentable.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 29/4/24.
//

import SwiftUI

struct CellRowRepresentable: View {
    var model: CellRepresentable
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.image)) { image in
                image
                    .resizable()
                    .frame(width: 90, 
                           height: 90)
            } placeholder: {
                Image(systemName: "photo")
            }
            .background(.clear)
            
            Text(model.name)
        }
    }
}
