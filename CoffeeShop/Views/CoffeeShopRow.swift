//
//  CoffeeShopRow.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI

struct CoffeeShopRow: View {
    let business: YelpBusiness
    private let frameSize = 80.0
    private let cornerRadius = 8.0

    var body: some View {
        HStack {
            if let url = URL(string: business.imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "cup.and.saucer.fill") // Indicates an error, show default image
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .cornerRadius(cornerRadius)
                    case .success(let image):
                        image.resizable() // Displays the loaded image.
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .cornerRadius(cornerRadius)
                    default:
                        // Acts as a placeholder.
                        ProgressView()
                            .frame(width: frameSize, height: frameSize)
                    }
                }
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
