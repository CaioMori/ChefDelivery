//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 03/12/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    var products: [ProductType]
    
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        Text("Produtos")
            .font(.title2)
            .bold()
            .padding()
            .frame(alignment: .leading)
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(products) { product in
                    Button {
                        selectedProduct = product
                    } label: {
                        StoreDetailProductItemView(product: product)
                    }
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(products: storesMock[0].products)
}
