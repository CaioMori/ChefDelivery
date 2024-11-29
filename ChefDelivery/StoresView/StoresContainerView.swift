//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title: String = "Lojas"
    @State private var ratingFilter = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    ForEach(1...5, id: \.self) {star in
                        Button {
                            ratingFilter = star
                        } label: {
                            Text("\(star) estrelas ou mais")
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { storeItem in
                    NavigationLink {StoreDetailView(store: storeItem)}
                    label: {
                        StoreItemView(order: storeItem)
                    }
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
}
