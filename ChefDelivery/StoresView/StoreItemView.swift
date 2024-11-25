//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: StoreType
    
    var body: some View {
        HStack {
            Image(order.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50, alignment: .center)
            VStack {
                Text(order.name)
                    .font(.subheadline)
                    .foregroundStyle(.colorRed)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreItemView(order: storesMock[0])
}
