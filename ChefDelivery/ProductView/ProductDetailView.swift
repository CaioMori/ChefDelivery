//
//  ProductDeatilView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 28/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    
    private let homeService = HomeService()
    
    @State private var productQuantity = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
        
            
            Spacer()
            
            ProductDetailButtonView {
                Task {
                   await confirmOrder()
                }
            }
        }
    }
    
    func confirmOrder() async {
        do {
            let result = try await homeService.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message ?? "")
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ProductDetailView(product: productMock)
}


