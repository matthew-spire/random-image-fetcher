//
//  ImageView.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import SwiftUI

struct ImageView: View {
    @StateObject private var viewModel = ImageViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No Image")
            }

            Button(action: {
                viewModel.fetchImage(random: "randomString", imageSize: 200)}) {
                    Text("Fetch Image")
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 12)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
