//
//  CoffeeShopViewModel.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI
import Combine

class CoffeeShopViewModel: ObservableObject {
    @Published var coffeeShops = [YelpBusiness]()
    @Published var isLoading = false

    private var currentPage = 0
    private let client = YelpAPIClient()

    func fetchCoffeeShops() {
        guard !isLoading else { return }
        isLoading = true

        client.fetchCoffeeShops(offset: currentPage * 10) { [weak self] newShops in
            DispatchQueue.main.async {
                self?.coffeeShops.append(contentsOf: newShops)
                self?.isLoading = false
                self?.currentPage += 1
            }
        }
    }
}
