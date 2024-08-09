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
                            Task {
                                if shop == viewModel.coffeeShops.last {
                                    await viewModel.fetchCoffeeShops()
                                }
                            }
                        }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Coffee Shops")
            .task {
                await viewModel.fetchCoffeeShops()
            }
        }
    }
}

#Preview {
    CoffeeShopListView()
}
