//
//  ImageViewModel.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import SwiftUI
// import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var random: String = ""
    @Published var imageSize: String = ""

    private var imageRepository: ImageRepository
    
    init(imageRepository: ImageRepository = ImageRepository()) {
        self.imageRepository = imageRepository
    }

    func fetchImage() {
        let randomString = random.isEmpty ? "accesso" : random

        guard let imageSizeInt = Int(imageSize) else {
            print("Invalid image size")
            return
        }

        imageRepository.fetchImage(random: randomString, imageSize: imageSizeInt) { [weak self] result in
            switch result {
            case .success(let image):
                self?.image = image
            case .failure(let error):
                print("Error fetching image: \(error.localizedDescription)")
            }
        }
    }
}
