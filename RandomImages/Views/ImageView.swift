//
//  ImageView.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import SwiftUI

struct ImageView: View {
    @StateObject private var viewModel = ImageViewModel()
    @State private var showAlert: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No Image")
            }

            TextField("Enter random string", text: $viewModel.random)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter image size", text: $viewModel.imageSize)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            Button(action: {
                if viewModel.imageSize.isEmpty {
                    showAlert = true
                } else {
                    showAlert = false
                    viewModel.fetchImage()
                }
            }) {
                Text("Fetch Image")
            }
            .buttonStyle(PrimaryButtonStyle())
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter an image size"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
