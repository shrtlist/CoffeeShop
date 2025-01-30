//
//  CoffeeShopRow.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI
import MapKit

struct CoffeeShopRow: View {
    let coffeeShop: MKMapItem
    private let frameSize = 30.0

    var body: some View {
        HStack(spacing: 20.0) {
            PlaceholderImageView(size: frameSize)

            VStack(alignment: .leading) {
                Text(coffeeShop.name ?? "No Name")
                    .font(.headline)
                if let postalAddress = coffeeShop.placemark.postalAddress {
                    Text(postalAddress.addressString)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview("CoffeeShopRow") {
    CoffeeShopRow(coffeeShop: MKMapItem.sample)
}
