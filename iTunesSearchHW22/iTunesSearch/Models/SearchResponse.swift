//
//  SearchResponse.swift
//  iTunesSearch
//
//  Created by Павло Пастернак on 18.05.2022.
//

import Foundation

// MARK: - Structure
struct SearchResponse: Codable {
    
    //MARK: - Properties
    let results: [StoreItem]
}
