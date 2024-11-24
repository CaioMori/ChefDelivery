//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    let orderMock: [OrderType] = [
        OrderType(id: 1, name: "Churrasco", image: "barbecue-banner"),
        OrderType(id: 2, name: "PF", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "Poke", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView {
            ForEach(orderMock) { orderItem in
                CarouselItemView(order: orderItem)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
