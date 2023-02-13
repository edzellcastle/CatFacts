//
//  CatFactsTests.swift
//  CatFactsTests
//
//  Created by David Lindsay on 2/9/23.
//

import XCTest

@testable import CatFacts

@MainActor final class CatFactsTests: XCTestCase {
    
    private var viewModel: CatViewModel!

    @MainActor override func setUpWithError() throws {
        super.setUp()
        viewModel = CatViewModel(apiService: APIClient())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchCatFact() async throws {
        viewModel.catFactString = try await viewModel.apiService.fetchRandomCatFact()
        XCTAssertTrue(viewModel.catFactString.count > 0, "Expected a string with a length greater than zero")
    }
}
