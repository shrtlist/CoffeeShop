//
//  MockCoffeeService.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/25/24.
//

import Foundation

final class MockCoffeeService: CoffeeServiceProtocol {
    func fetchCoffeeShops(offset: Int, resultLimit: Int) async throws -> [YelpBusiness] {
        let location = YelpBusiness.Location(address1: "asdf", city: "San Francisco", state: "CA", zipCode: "94102")
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
