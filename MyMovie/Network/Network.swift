//
//  Network.swift
//  MyMovie
//
//  Created by 민지은 on 2024/05/09.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case unknown
}

class Network {
    
    static let shared = Network()
    private init() { }
    
    func requestTrendAPI() async throws -> TVModel {
        let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5)
        
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlN2Y3M2E2NjU5NzI0MjJiY2Y2ODQ3MjhjYzdjYjFlZiIsInN1YiI6IjY1YTZhOGNiZWI2NGYxMDEyOGY1MjJkMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hEw65Qf7wpqNmWwjF0ezqN9Ncj10q2a2OInYR7uHpZc", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.unknown
        }

        do {
            let decodedData = try JSONDecoder().decode(TVModel.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.invalidResponse
        }
    }
}
