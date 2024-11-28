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
            VStack(alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)

                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)

                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }
            
            Spacer()
            
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
            
            Spacer()
            
            Button {
                print("pressed")
            } label: {
                HStack {
                    Image(systemName: "cart")
                    
                    Text("Adicionar ao carrinho")
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
                .background(Color("ColorRed"))
                .cornerRadius(32)
                .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
            }

        }
    }
}

#Preview {
    ProductDetailView(product: productMock)
}
