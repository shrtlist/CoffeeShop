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
    private let url = "https://api.yelp.com/v3/businesses/search"
    private let searchTerm = "coffee shops"
    private let location = "410 Townsend Street, San Francisco, CA"

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func fetchCoffeeShops(offset: Int = 0, resultLimit: Int) async throws -> [YelpBusiness] {
        let parameters: [String: Any] = [
            "term": searchTerm,
            "location": location,
            "limit": resultLimit,
            "offset": offset
        ]
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)"
        ]

        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: YelpResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success(let yelpResponse):
                    continuation.resume(returning: yelpResponse.businesses)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
