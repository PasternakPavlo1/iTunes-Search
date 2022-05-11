//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Павло Пастернак on 11.05.2022.
//

import UIKit
import Foundation

// MARK: - Class
class StoreItemController {
    
    enum StoreItemError: Error, LocalizedError {
        case itemsNotFound
        case imageDataMissing
    }
    
// MARK: - Methods
    func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
        var baseURL = URLComponents(string: "https://itunes.apple.com/search")!
        
        baseURL.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: baseURL.url!)
            guard let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 else {
            throw StoreItemError.itemsNotFound
        }

        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)

        return searchResponse.results
    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 else {
        throw StoreItemError.imageDataMissing
    }
        
        guard let image = UIImage(data: data) else {
            throw StoreItemError.itemsNotFound
        }
        
        return image
    }
}
