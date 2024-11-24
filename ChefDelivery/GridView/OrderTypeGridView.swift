//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct OrderTypeGridView: View {
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows:  gridLayout, spacing: 15) {
            ForEach(ordersMock) { orderItem in
                OrderTypeView(orderType: orderItem)
            }
        }
        .frame(height: 200)
        .padding(.top, 15)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OrderTypeGridView()
}
