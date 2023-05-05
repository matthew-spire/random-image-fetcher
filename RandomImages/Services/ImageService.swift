//
//  ImageService.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import Foundation
import SwiftUI
import Combine

class ImageService {
    private let networkService = NetworkService()

    func fetchImage(random: String = "accesso", imageSize: Int, completion: @escaping (UIImage?) -> Void) {
        let urlString = "https://picsum.photos/seed/\(random)/\(imageSize)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        networkService.requestData(url: url) { data, error in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Error fetching image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
    }
}
