//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 05/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Text("Chef Delivery")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundStyle(Color("ColorRed"))
                .opacity(isAnimating ? 1: 0)
                .offset(y: isAnimating ? 0 : -40)
            
            Text("Peça as suas comidas no conforto de sua casa")
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundStyle(.black.opacity(0.7))
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
            
            Spacer()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    HomeView()
}
