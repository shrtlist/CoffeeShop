//
//  CoffeeServiceProtocol.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/25/24.
//

import Foundation

protocol CoffeeServiceProtocol: AnyObject {
    func fetchCoffeeShops(offset: Int, resultLimit: Int) async throws -> [YelpBusiness]
}
