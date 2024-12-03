//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 03/12/24.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    var product: ProductType
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                
                Text(product.description)
                    .foregroundStyle(.black.opacity(0.5))
                    .padding(.trailing)
                    .multilineTextAlignment(.leading)
                
                Text(product.formattedPrice)
            }
            Spacer()
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
        }
        .padding()
        .foregroundStyle(.black)
    }
}

#Preview {
    StoreDetailProductItemView(product: productMock)
}
