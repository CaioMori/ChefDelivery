//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Caio Mori on 25/11/24.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let rating: Int
    let products: [ProductType]
}
