//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct StoresContainerView: View {
    let title: String = "Lojas"
    var availableStores: [StoreType]
    
    @State private var ratingFilter = 0
    
    
    var filteredStores: [StoreType] {
        return availableStores.filter {store in
            store.rating >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self) {rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if (rating > 1){
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                            
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado...")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.colorRed)
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { storeItem in
                        NavigationLink {StoreDetailView(store: storeItem)}
                        label: {
                            StoreItemView(order: storeItem)
                        }
                    }
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView(availableStores: storesMock)
}
