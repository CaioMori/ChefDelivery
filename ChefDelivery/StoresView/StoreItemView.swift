//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50, alignment: .center)
            VStack {
                Text(order.name)
                    .font(.subheadline)
            }
            Spacer()
        }
        .onTapGesture {
            print("Order \(order.name) selected")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreItemView(order: OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo"))
}
