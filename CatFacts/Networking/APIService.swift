//
//  APIService.swift
//  CatFacts
//
//  Created by David Lindsay on 2/9/23.
//

import Foundation

protocol APIService {
    
    // MARK: - Methods
    
    func fetchRandomCatFact() async throws -> String
}
