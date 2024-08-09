//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI

struct CoffeeShopListView: View {
    @StateObject private var viewModel = CoffeeShopViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.coffeeShops) { shop in
                    CoffeeShopRow(business: shop)
                        .onAppear {
                            if shop == viewModel.coffeeShops.last {
                                viewModel.fetchCoffeeShops()
                            }
                        }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Coffee Shops")
            .onAppear {
                viewModel.fetchCoffeeShops()
            }
        }
    }
}

struct CoffeeShopRow: View {
    let business: YelpBusiness

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: business.image_url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }

            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.headline)
                Text("\(business.location.address1), \(business.location.city), \(business.location.state)")
                    .font(.subheadline)
                Text("Price: \(business.price ?? "N/A")")
                    .font(.subheadline)
                Text("Rating: \(business.rating)")
                    .font(.subheadline)
            }
        }
    }
}


#Preview {
    CoffeeShopListView()
}
