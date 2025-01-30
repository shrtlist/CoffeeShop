//
//  MKMapItem+Extensions.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 10/29/24.
//

import MapKit
import Contacts

extension MKMapItem: @retroactive Identifiable {
    public var id: String { identifier!.rawValue }

    static var sample: MKMapItem {
        let coordinate = CLLocationCoordinate2D(latitude: 37.774722, longitude: -122.41823)
        let addressDictionary = [CNPostalAddressStreetKey: "115 Sansome St",
                                   CNPostalAddressCityKey: "San Francisco",
                                  CNPostalAddressStateKey: "CA",
                             CNPostalAddressPostalCodeKey: "94104"]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        return MKMapItem(placemark: placemark)
    }
}
