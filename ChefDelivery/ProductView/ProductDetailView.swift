//
//  ProductDeatilView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 28/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    
    @State private var productQuantity = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView()
            
            Spacer()
            
            ProductDetailButtonView()

        }
    }
}

#Preview {
    ProductDetailView(product: productMock)
}


