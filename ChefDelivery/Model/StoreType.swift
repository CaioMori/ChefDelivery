//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Caio Mori on 25/11/24.
//

import Foundation

struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let rating: Int
    let products: [ProductType]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location, rating, products
        case logoImage = "logo_image"
        case headerImage = "header_image"
    }
}
