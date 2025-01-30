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
    func fetchCoffeeShops(location: String, offset: Int, resultLimit: Int) async throws -> [MKMapItem] {
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

        return response.mapItems
    }
}
