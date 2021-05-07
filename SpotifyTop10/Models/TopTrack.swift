//
//  TopTrack.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import UIKit

struct TopTracks: Codable {
    let tracks: [Track]
}

struct Track: Codable {
    let artists: [Artist]
    let name: String
    let popularity: Int
    let explicit: Bool
}

struct Artist: Codable {
    let name: String
}
