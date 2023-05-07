//
//  ImageRepository.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

// import Foundation
import SwiftUI

class ImageRepository {
    private let imageService: ImageService

    init(imageService: ImageService = ImageService()) {
        self.imageService = imageService
    }

    func fetchImage(random: String, imageSize: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
        imageService.fetchImage(random: random, imageSize: imageSize, completion: completion)
    }
}
