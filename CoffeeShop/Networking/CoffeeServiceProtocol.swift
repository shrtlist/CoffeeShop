//
//  CoffeeServiceProtocol.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/25/24.
//

import MapKit

protocol CoffeeServiceProtocol: AnyObject {
    func fetchCoffeeShops(location: String, offset: Int, resultLimit: Int) async throws -> [MKMapItem]
}
