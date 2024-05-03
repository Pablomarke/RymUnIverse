//
//  ViewExtension.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 3/5/24.
//

import SwiftUI

extension View {
    func fadeInAnimation() -> some View {
        self.modifier(FadeInModifier())
    }
    
    func appMainBackground<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        ZStack {
            Color.cyan
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}
