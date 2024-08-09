//
//  YelpBusiness.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import Foundation

struct YelpBusiness: Identifiable, Decodable, Equatable {
    
    let id: String
    let name: String
    let imageUrl: String
    let url: String
    let reviewCount: Int
    let rating: Double
    let price: String?
    let location: Location
    let phone: String

    struct Location: Decodable {
        let address1: String
        let city: String
        let state: String
        let zipCode: String
    }

    static func == (lhs: YelpBusiness, rhs: YelpBusiness) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
