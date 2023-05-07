//
//  NetworkService.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import Foundation

class NetworkService {
    func requestData(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }
}
