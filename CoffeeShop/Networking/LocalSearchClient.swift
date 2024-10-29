//
//  LocalSearchClient.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 10/29/24.
//

import MapKit
import CoreLocation
import Contacts

class LocalSearchClient: CoffeeServiceProtocol {
    func fetchCoffeeShops(location: String, offset: Int, resultLimit: Int) async throws -> [YelpBusiness] {
        let placemarks = try await CLGeocoder().geocodeAddressString(location)

        guard let coordinate = placemarks.first?.location?.coordinate else {
            throw CLError(.geocodeFoundNoResult)
        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "coffee shop"
        request.region = MKCoordinateRegion(center: coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

        let search = MKLocalSearch(request: request)

        let response = try await search.start()

        var coffeeShops: [YelpBusiness] = []

        for mapItem in response.mapItems {
            if let identifier = mapItem.identifier,
               let name = mapItem.name,
               let url = mapItem.url,
               let phone = mapItem.phoneNumber,
               let postalAddress = mapItem.placemark.postalAddress {
                let location = YelpBusiness.Location(address1: postalAddress.street, city: postalAddress.city, state: postalAddress.state, zipCode: postalAddress.postalCode)

                let yelpBusiness = YelpBusiness(id: identifier.rawValue, name: name, imageUrl: url.absoluteString, url: url.absoluteString, reviewCount: 0, rating: 0.0, price: nil, location: location, phone: phone)

                coffeeShops.append(yelpBusiness)
            }
        }
        return coffeeShops
    }
}
