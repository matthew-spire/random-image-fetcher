//
//  PrimaryButtonStyle.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/7/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
