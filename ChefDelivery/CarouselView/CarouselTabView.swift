//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var currentIndex: Int = 1
    @State private var timer: Timer? = nil
    
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
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .onChange(of: currentIndex) { oldValue, newValue in
            restartTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 1)) {
                if currentIndex == orderMock.count {
                    currentIndex = 1
                } else {
                    currentIndex += 1
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func restartTimer() {
        stopTimer()
        startTimer()
    }
}


#Preview {
    CarouselTabView()
}

