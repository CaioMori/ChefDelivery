//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Caio Mori on 31/12/24.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let ordersUrl = URL(string: "https://private-2f6f8b-caiomori.apiary-mock.com/product") else {
            return.failure(.invalidURL)
        }
        
        let encodedProduct = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: ordersUrl)
        request.httpMethod = "POST"
        request.httpBody = encodedProduct
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let responseObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(responseObject)
    }
    
    func fetchDataWithAlamofire(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF
            .request("https://private-2f6f8b-caiomori.apiary-mock.com/stores")
            .responseDecodable(of: [StoreType].self) { response in
                switch response.result {
                case .success(let stores):
                    completion(stores, nil)
                default: break
                }
            }
    }
}
