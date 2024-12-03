//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 25/11/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    // Environment é o ambiente que uma view esta sendo exibida
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            StoreDetailHeaderView(store: store)
            
            StoreDetailProductsView(products: store.products)
            
            
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "cart")
                        
                        Text("Lojas")
                    }
                    .foregroundStyle(.colorRed)
                    .bold()
                }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
