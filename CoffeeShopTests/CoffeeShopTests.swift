//
//  CoffeeShopTests.swift
//  CoffeeShopTests
//
//  Created by Marco Abundo on 8/8/24.
//

import XCTest
@testable import CoffeeShop

final class CoffeeShopTests: XCTestCase {

    func testNumberFormatter() {
        let testValue = 4.700001
        let formattedRating = NumberFormatter.oneDecimalPlace.string(from: NSNumber(value: testValue))!
        let numberOfCharacters = formattedRating.count

        XCTAssertEqual(numberOfCharacters, 3, "Number of characters must be 3")
    }

    @MainActor func testfetchCoffeeShops() async {
        let sut = CoffeeShopViewModel()

        await sut.fetchCoffeeShops()

        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.coffeeShops.count > 0)
    }
}
