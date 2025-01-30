//
//  CoffeeShopListView.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI
import MapKit

struct CoffeeShopListView: View {
    @State private var viewModel = CoffeeShopViewModel()
    @State private var selectedCoffeeShop: MKMapItem?
    @State private var showingDetail = false

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if viewModel.coffeeShops.isEmpty {
                    ScrollView {
                        ContentUnavailableView.init("No results", systemImage: "cup.and.saucer.fill")
                    }
                } else {
                    List(viewModel.coffeeShops) { coffeeShop in
                        Button(action: {
                            selectedCoffeeShop = coffeeShop
                            showingDetail = true
                        }) {
                            CoffeeShopRow(coffeeShop: coffeeShop)
                                .task {
                                    if coffeeShop == viewModel.coffeeShops.last {
                                        await viewModel.fetchCoffeeShops()
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Coffee Shops")
        }
        .task {
            await viewModel.fetchCoffeeShops()
        }
        .refreshable {
            await viewModel.fetchCoffeeShops()
        }
        .sheet(isPresented: $showingDetail) {
            if let selectedShop = selectedCoffeeShop {
                MapItemDetailViewControllerRepresentable(mapItem: selectedShop)
            }
        }
    }
}

#Preview {
    CoffeeShopListView()
}
