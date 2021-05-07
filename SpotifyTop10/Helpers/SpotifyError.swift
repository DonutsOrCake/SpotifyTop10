//
//  SpotifyError.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import Foundation

enum SpotifyError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server."
        case .thrownError(let error):
            return "Something went wrong decoding the data. \(error)"
        case .noData:
            return "The server responded with no data."
        case .unableToDecode:
            return "Unable to decode json."
        }
    }
    
}
