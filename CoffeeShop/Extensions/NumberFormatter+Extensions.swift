//
//  NumberFormatter+Extensions.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import Foundation

extension NumberFormatter {
    static var oneDecimalPlace: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        return formatter
    }
}
