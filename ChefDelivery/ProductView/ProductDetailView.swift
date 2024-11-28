//
//  ProductDeatilView.swift
//  ChefDelivery
//
//  Created by Caio Mori on 28/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    var body: some View {
        Text(product.name)
    }
}

#Preview {
    ProductDetailView(product: productMock)
}
