//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title: String = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
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
