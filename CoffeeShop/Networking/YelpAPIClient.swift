//
//  YelpAPIClient.swift
//  CoffeeShop
//
//  Created by Marco Abundo on 8/8/24.
//

import Foundation
import Alamofire

class YelpAPIClient {
    private let apiKey = "GhMnYVSy1cHNqJhgOhqPkVwzPcXzEXScOfUfrYDMEnlR4RmHLdnzdipqAt3esgmyfgiAOjJ8vdrzBfW9-ZBtia3oU6gX-jTg0eZRbBne6hjqg7ASopMdTr3otVW1ZnYx"

    func fetchCoffeeShops(offset: Int = 0, completion: @escaping ([YelpBusiness]) -> Void) {
        let url = "https://api.yelp.com/v3/businesses/search"
        let parameters: [String: Any] = [
            "term": "coffee shops",
            "latitude": 37.776575,
            "longitude": -122.394978,
            "limit": 10,
            "offset": offset
        ]
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)"
        ]

        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: YelpResponse.self) { response in
            switch response.result {
            case .success(let yelpResponse):
                completion(yelpResponse.businesses)
            case .failure(let error):
                print("Failed to fetch coffee shops: \(error)")
                completion([])
            }
        }
    }
}
