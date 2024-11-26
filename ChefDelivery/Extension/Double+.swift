//
//  Double+.swift
//  ChefDelivery
//
//  Created by Caio Mori on 26/11/24.
//

import Foundation

extension Double {
    func formatPrice () -> String {
        var formattedString: String = String(format: "%.2f", self).replacingOccurrences(of: ".", with: ",")

        
        return formattedString
    }
}
