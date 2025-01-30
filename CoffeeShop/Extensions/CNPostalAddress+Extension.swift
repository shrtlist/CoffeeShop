//
//  CNPostalAddress+Extension.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 1/29/25.
//

import Contacts

extension CNPostalAddress {
    var addressString: String {
        let mutableAddress = CNMutablePostalAddress()
        mutableAddress.street = self.street
        mutableAddress.city = self.city
        mutableAddress.state = self.state
        mutableAddress.postalCode = self.postalCode
        mutableAddress.subLocality = self.subLocality
        mutableAddress.subAdministrativeArea = self.subAdministrativeArea
        // Exclude country (don't set `mutableAddress.country`)
        
        let formatter = CNPostalAddressFormatter()
        return formatter.string(from: mutableAddress).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
