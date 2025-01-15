//
//  CoffeeShopRow.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI

struct CoffeeShopRow: View {
    let business: YelpBusiness
    private let frameSize = 40.0
    private let cornerRadius = 8.0

    var body: some View {
        HStack(spacing: 20.0) {
            if let url = URL(string: business.imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .failure: // Indicates an error, show default image
                        PlaceholderImageView(size: frameSize)
                    case .success(let image): // Displays the loaded image.
                        image
                            .scaledToFit()
                            .cornerRadius(cornerRadius)
                    default:
                        ProgressView()
                            .scaleEffect(2.0, anchor: .center)
                    }
                }
                .frame(width: frameSize, height: frameSize)
            } else {
                PlaceholderImageView(size: frameSize)
            }

            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.headline)
                Text("\(business.location.address1), \(business.location.city), \(business.location.state)")
                    .font(.subheadline)
                Text("Price: \(business.price ?? "N/A")")
                    .font(.subheadline)
                if let formattedRating = NumberFormatter.oneDecimalPlace.string(from: NSNumber(value: business.rating)) {
                    Text("Rating: \(formattedRating)")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview("CoffeeShopRow") {
    let location = YelpBusiness.Location(address1: "123 Main St", city: "Anytown", state: "CA", zipCode: "90210")
    let business = YelpBusiness(id: "0", name: "CoffeeShop", imageUrl: "https://picsum.photos/50/50", url: "https://www.google.com", reviewCount: 12, rating: 4.8, price: "$$$", location: location, phone: "415-555-1212")
    CoffeeShopRow(business: business)
}
