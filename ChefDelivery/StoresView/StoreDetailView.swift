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
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Image(store.logoImage)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack {
                Text(store.location)
                
                Spacer()
                
                ForEach(1...store.rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()

            ScrollView {
                ForEach(store.products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
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
            }
            .scrollIndicators(.hidden)
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
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
