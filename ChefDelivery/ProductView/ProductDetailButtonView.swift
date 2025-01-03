//
//  ProductDetailButtonView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 03/12/24.
//

import SwiftUI

struct ProductDetailButtonView: View {
    var onPress: () -> Void
    
    var body: some View {
        Button {
            onPress()
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Enviar pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .foregroundStyle(.white)
            .background(Color("ColorRed"))
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}
#Preview {
    ProductDetailButtonView(onPress: {})
}
