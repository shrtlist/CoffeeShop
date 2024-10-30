//
//  MKMapItem+Extensions.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 10/29/24.
//

import MapKit

extension MKMapItem: @retroactive Identifiable {
    public var id: String { identifier!.rawValue }
}
