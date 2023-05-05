//
//  ImageRepository.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import Foundation
import UIKit

class ImageRepository {
    private let imageService = ImageService()

    func fetchImage(random: String = "accesso", imageSize: Int, completion: @escaping (UIImage?) -> Void) {
        imageService.fetchImage(random: random, imageSize: imageSize, completion: completion)
    }
}
