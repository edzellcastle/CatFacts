//
//  APIClient.swift
//  CatFacts
//
//  Created by David Lindsay on 2/9/23.
//

import Foundation

final class APIClient: APIService {

    private func fetchCatFacts(count: Int) async throws -> CatFactsResponse {
        let url = URL(string: catFactEndpoint + "?count=" + String(count))!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CatFactsResponse.self, from: data)
    }
    
    public func fetchRandomCatFact() async throws -> String {
        let catFact = try await fetchCatFacts(count: 1)
        return catFact.data[0]
    }
    
}
