//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        guard let ordersUrl = URL(string: "https://private-2f6f8b-caiomori.apiary-mock.com/order-types") else {
            return
        }
        URLSession.shared.dataTask(with: ordersUrl) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let formattedData = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
                    print(formattedData)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
