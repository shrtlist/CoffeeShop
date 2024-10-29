//
//  MockCoffeeService.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/25/24.
//

import Foundation

final class MockCoffeeService: CoffeeServiceProtocol {
    func fetchCoffeeShops(location: String, offset: Int, resultLimit: Int) async throws -> [YelpBusiness] {
        let location = YelpBusiness.Location(address1: "150 2nd St", city: "San Francisco", state: "CA", zipCode: "94103")
        return [YelpBusiness(id: "00001",
                             name: "Blue Bottle",
                             imageUrl: "",
                             url: "http://www.bluebottle.com",
                             reviewCount: 0,
                             rating: 5,
                             price: nil,
                             location: location,
                             phone: "415-555-1212")]
    }
}
