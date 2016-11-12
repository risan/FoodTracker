//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Risan Bagja Pradana  on 11/8/16.
//  Copyright © 2016 Risan Bagja Pradana. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker tests
    func testMealInitialization() {
        // Success initialization.
        let validMeal = Meal(name: "Foo", photo: nil, rating: 5)
        XCTAssertNotNil(validMeal)
        
        // Failed initialization: empty name.
        let emptyNameMeal = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(emptyNameMeal, "Empty name is invalid")
        
        // Failed intialization: negative rating.
        let negativeRatingMeal = Meal(name: "Foo", photo: nil, rating: -999)
        XCTAssertNil(negativeRatingMeal, "Negative rating is invalid")
    }
    
}
