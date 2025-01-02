//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    private let homeService = HomeService()
    @State var storesResult: [StoreType] = []
    
    func getStores() async {
        do {
            let result = try await homeService.fetchData()
            switch result {
            case .success(let stores):
                self.storesResult = stores
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
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
            Task {
                await getStores()
            }
        }
    }
    
    
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
