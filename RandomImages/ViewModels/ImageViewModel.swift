//
//  ImageViewModel.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?

    private var imageRepository = ImageRepository()

    func fetchImage(random: String, imageSize: Int) {
        imageRepository.fetchImage(random: random, imageSize: imageSize) { [weak self] image in
            self?.image = image
        }
    }
}
