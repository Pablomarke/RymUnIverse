//
//  BackArrow.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 8/5/24.
//

import SwiftUI

struct BackArrow: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            }
        }
    }
}
