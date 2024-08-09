//
//  YelpResponse.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import Foundation

struct YelpResponse: Decodable {
    let total: Int
    let businesses: [YelpBusiness]
}
