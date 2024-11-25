//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 25/11/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
