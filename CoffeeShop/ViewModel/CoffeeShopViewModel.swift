//
//  CoffeeShopViewModel.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import SwiftUI

@MainActor
class CoffeeShopViewModel: ObservableObject {
    @Published var coffeeShops = [YelpBusiness]()
    @Published var isLoading = false

    private var currentPage = 0
    private let resultLimit = 10
    private let coffeeService: CoffeeServiceProtocol

    init(coffeeService: CoffeeServiceProtocol = YelpAPIClient()) {
        self.coffeeService = coffeeService
    }

    private var offset: Int {
        currentPage * resultLimit
    }

    func fetchCoffeeShops() async {
        guard !isLoading else { return }
        isLoading = true

        do {
            let newShops = try await coffeeService.fetchCoffeeShops(offset: offset, resultLimit: resultLimit)
            coffeeShops.append(contentsOf: newShops)
            currentPage += 1
        } catch {
            print("Failed to fetch coffee shops: \(error)")
        }

        isLoading = false
    }
}
