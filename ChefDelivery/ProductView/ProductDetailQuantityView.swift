//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 03/12/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @State private var productQuantity = 1
    
    var body: some View {
        VStack {
            Text("Quantidade")
                .font(.title3)
                .bold()
            HStack(spacing: 8){
                Button {
                    if (productQuantity > 1) {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title3)
                        .bold()
                }
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title3)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView()
}
