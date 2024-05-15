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
            ZStack {
                Circle()
                    .foregroundColor(model.colorStatus)
                    .frame(width: 125,
                           height: 125)
                KFImage(URL(string: model.image))
                    .resizable()
                    .frame(width: 120,
                           height: 120)
                    .clipShape(Circle())
            }                    
            .fadeInAnimation()

            VStack {
                Text(model.name)
                    .font(.title2)
                    .foregroundColor(Color(.sRGB,
                                           red: 0.2, green: 0.2, blue: 0.2,
                                           opacity: 1.0))
                Text(model.species)
                    .font(.subheadline)
                    .foregroundColor(Color(.sRGB,
                                           red: 0.3, green: 0.3, blue: 0.3,
                                           opacity: 1.0))
            }
            .padding()
        }
    }
}
