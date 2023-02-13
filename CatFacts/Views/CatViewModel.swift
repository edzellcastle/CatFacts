//
//  CatViewModel.swift
//  CatFacts
//
//  Created by David Lindsay on 2/9/23.
//

import Foundation

@MainActor final class CatViewModel: ObservableObject {
    
    // MARK: - Properties
    
    public let apiService: APIService
    @Published public var catFactString: String = ""
    
    // MARK: - Initialization
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    // MARK: - Public API
    
    func start() {
        Task {
            do {
                catFactString = try await apiService.fetchRandomCatFact()
            } catch {
                print("Error: Unable to fetch cat facts \(error)")
            }
        }
    }
    
}
