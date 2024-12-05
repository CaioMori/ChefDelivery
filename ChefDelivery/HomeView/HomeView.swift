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
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(Color("ColorRed"))
                    .frame(width: isAnimating ? 200 : 130)
                    .position(x: geometry.size.width - geometry.size.width * 0.9, y: geometry.size.height - geometry.size.height * 0.9)
                    .blur(radius: isAnimating ? 60 : 50)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundStyle(Color("ColorRed"))
                    .frame(width: isAnimating ? 200 : 130)
                    .position(x: geometry.size.width - geometry.size.width * 0.3, y: geometry.size.height - geometry.size.height * 0.3)
                    .blur(radius: isAnimating ? 60 : 50)
                    .opacity(isAnimating ? 0.5 : 0)
                
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
    }
}

#Preview {
    HomeView()
}
