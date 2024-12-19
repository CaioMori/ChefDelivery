//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var currentIndex: Int = 1
    
    let orderMock: [OrderType] = [
        OrderType(id: 1, name: "Churrasco", image: "barbecue-banner"),
        OrderType(id: 2, name: "PF", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "Poke", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(orderMock) { orderItem in
                CarouselItemView(order: orderItem)
                    .tag(orderItem.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                
                withAnimation(.easeInOut(duration: 1)) {
                    if currentIndex > orderMock.count {
                        currentIndex = 1
                    }
                    currentIndex += 1
                }
            }
        }
    }
}

#Preview {
    CarouselTabView()
}
