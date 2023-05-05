//
//  NetworkService.swift
//  RandomImages
//
//  Created by Matthew Spire on 5/4/23.
//

import Foundation

class NetworkService {
    func requestData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }

        task.resume()
    }
}
