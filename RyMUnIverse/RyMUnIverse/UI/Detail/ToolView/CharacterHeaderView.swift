//
//  CharacterHeaderView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 8/5/24.
//

import SwiftUI
import Kingfisher

struct CharacterHeaderView: View {
    var name: String
    var image: String
    
    var body: some View {
        Text(name)
            .font(.custom("Get Schwifty", size: 40))
            .foregroundStyle(Color.white)
        KFImage(URL(string: image))
            .clipShape(Circle())
            .padding()
            .fadeInAnimation()
    }
}
