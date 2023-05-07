//
//  ImageService.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

// import Foundation
import SwiftUI
// import Combine

class ImageService {
    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func fetchImage(random: String, imageSize: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let urlString = "https://picsum.photos/seed/\(random)/\(imageSize)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        networkService.requestData(url: url) { result in
            switch result {
                case .success(let data):
                    if let image = UIImage(data: data) {
                        completion(.success(image))
                    } else {
                        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to create UIImage from data"])))
                    }
                case .failure(let error):
                    print("Error fetching image: \(error.localizedDescription)")
                    completion(.failure(error))
            }
        }
    }
}
