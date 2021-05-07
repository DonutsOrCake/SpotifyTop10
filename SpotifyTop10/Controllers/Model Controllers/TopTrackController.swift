//
//  TopTrackController.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import UIKit

class TopTrackController {
    
    static func fetchTracks(for artistID: String, completion: @escaping (Result<[Track], SpotifyError>) -> Void) {
        
        let baseURL = "https://api.spotify.com/v1/artists/\(artistID)/top-tracks"
        var components = URLComponents(string: baseURL)
        let marketQuery = URLQueryItem(name: "market", value: "US")
        components?.queryItems = [marketQuery]
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        print(finalURL)
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        let accessToken = Strings.bearerToken
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("FETCH TRACKS STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topTracks = try JSONDecoder().decode(TopTracks.self, from: data)
                let tracks = topTracks.tracks
                completion(.success(tracks))
            } catch {
                return completion(.failure(.unableToDecode))
            }
        }.resume()
        
    }//End of func
}//End of class
