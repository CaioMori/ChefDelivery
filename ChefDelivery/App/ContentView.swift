//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 20)
                .padding(.top, 15)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                    StoresContainerView()
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
