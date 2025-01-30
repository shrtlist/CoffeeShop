//
//  CNPostalAddress+Extension.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 1/29/25.
//

import Contacts

extension CNPostalAddress {
    var addressString: String {
        return CNPostalAddressFormatter.string(from: self, style: .mailingAddress)
    }
}
