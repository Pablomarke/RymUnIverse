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
                .clipShape(Circle())
                .fadeInAnimation()
            VStack {
                Text(model.name)
                    .font(.callout)
                Text(model.status)
                    .font(.subheadline)
            }
            
            
        }
    }
}
