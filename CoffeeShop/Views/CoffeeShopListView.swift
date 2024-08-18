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
        NavigationView {
            List {
                ForEach(viewModel.coffeeShops) { coffeeShop in
                    CoffeeShopRow(business: coffeeShop)
                        .onAppear {
                            Task {
                                if coffeeShop == viewModel.coffeeShops.last {
                                    await viewModel.fetchCoffeeShops()
                                }
                            }
                        }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if viewModel.coffeeShops.isEmpty {
                    ContentUnavailableView.init("No results", systemImage: "cup.and.saucer.fill")
                }
            }
            .navigationTitle("Coffee Shops")
            .task {
                await viewModel.fetchCoffeeShops()
            }
            .refreshable {
                await viewModel.fetchCoffeeShops()
            }
        }
    }
}

#Preview {
    CoffeeShopListView()
}
