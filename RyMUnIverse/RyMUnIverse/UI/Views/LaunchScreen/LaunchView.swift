//
//  LaunchView.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 8/5/24.
//

import SwiftUI

struct LaunchView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            appMainBackground(content: {
                HeaderTextView()
            })
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
            .navigationBarHidden(true)
            .background(
                NavigationLink(destination: HomeWireframe.createView()
                               , isActive: $isActive) {
                    EmptyView()
                }
            )
        }
    }
}

