//
//  MockCoffeeService.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/25/24.
//

import MapKit

final class MockCoffeeService: CoffeeServiceProtocol {
    func fetchCoffeeShops(location: String, offset: Int, resultLimit: Int) async throws -> [MKMapItem] {
        return [MKMapItem.sample]
    }
}
