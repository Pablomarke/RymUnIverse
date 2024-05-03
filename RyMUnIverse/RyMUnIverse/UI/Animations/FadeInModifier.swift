//
//  FadeInModifier.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 3/5/24.
//

import SwiftUI

struct FadeInModifier: ViewModifier {
    @State private var textOpacity = 0.0
    
    func body(content: Content) -> some View {
        content
            .opacity(textOpacity)
            .onAppear {
                withAnimation(.linear(duration: 1.4)) {
                    textOpacity = 1.0
                }
            }
    }
}
