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
    @State var isLoading: Bool = true
    
    func getStores() async {
        do {
            self.isLoading = true
            let result = try await homeService.fetchData()
            switch result {
            case .success(let stores):
                self.storesResult = stores
                print("storesResult atualizados:", self.storesResult)
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
        self.isLoading = false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 20)
                        .padding(.top, 15)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(availableStores: storesResult)
                        }
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
