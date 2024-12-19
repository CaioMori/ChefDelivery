//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 05/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    
    let buttonHeight: CGFloat = 80
    
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
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .opacity(isAnimating ? 1 : 0)
                        .gesture(
                            DragGesture()
                                .onChanged({gesture in
                                    withAnimation(.easeInOut(duration: 0.3)){
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 1)){
                                        imageOffset = .zero
                                    }
                                })
                        )
                    
                    ZStack {
                        Capsule()
                            .fill(Color.colorRed)
                            .opacity(0.2)
                        
                        Capsule()
                            .fill(Color.colorRed)
                            .opacity(0.2)
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.colorRedDark)
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(Color.colorRed)
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.colorRed)
                                
                                Circle()
                                    .fill(Color.colorRedDark)
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundStyle(Color.white)
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    if (gesture.translation.width >= 0 && buttonOffset <= (geometry.size.width - 60) - buttonHeight) {
                                        withAnimation(.easeInOut) {
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    if  (buttonOffset > (geometry.size.width - 60) / 2){
                                        withAnimation(.easeInOut) {
                                            buttonOffset = (geometry.size.width - 60) - buttonHeight
                                        }
                                        // navegarte
                                    } else {
                                        withAnimation(.easeInOut) {
                                            buttonOffset = 0
                                    }
                                    }
                                })
                        )
                        
                        
                    }
                    .frame(
                        width: geometry.size.width - 60,
                        height: buttonHeight
                    )
                    
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
