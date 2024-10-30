//
//  CoffeeShopListView.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI

struct CoffeeShopListView: View {
    @StateObject private var viewModel = CoffeeShopViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.coffeeShops) { coffeeShop in
                CoffeeShopRow(business: coffeeShop)
                    .task {
                        if coffeeShop == viewModel.coffeeShops.last {
                            await viewModel.fetchCoffeeShops()
                        }
                    }
            }
            .navigationTitle("Coffee Shops")

            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if viewModel.coffeeShops.isEmpty {
                ContentUnavailableView.init("No results", systemImage: "cup.and.saucer.fill")
            }
        }
        .task {
            await viewModel.fetchCoffeeShops()
        }
        .refreshable {
            await viewModel.fetchCoffeeShops()
        }
    }
}

#Preview {
    CoffeeShopListView()
}
