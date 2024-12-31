//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Caio Mori on 31/12/24.
//

import Foundation

struct HomeService {
    func fetchData() {
        guard let ordersUrl = URL(string: "https://private-2f6f8b-caiomori.apiary-mock.com/stores") else {
            return
        }
        
        URLSession.shared.dataTask(with: ordersUrl) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let formattedStores = try? JSONDecoder().decode([StoreType].self, from: data)
                print(formattedStores ?? "nada")
            }
        }
        .resume()
    }
}
