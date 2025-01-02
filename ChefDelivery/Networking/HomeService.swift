//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Caio Mori on 31/12/24.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let ordersUrl = URL(string: "https://private-2f6f8b-caiomori.apiary-mock.com/stores") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: ordersUrl)
        
        request.httpMethod = "GET"
        
        let(data, _) = try await URLSession.shared.data(for: request)
        
        let storesObject = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObject)
    }
}
