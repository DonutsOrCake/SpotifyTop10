//
//  FavoriteArtistController.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import Foundation

class FavoriteArtistController {
    
    //MARK: - Shared Instance
    static let sharedInstance = FavoriteArtistController()
    
    
    //MARK: - Properties
    let artists: [FavoriteArtist] = {
        let dababy = FavoriteArtist(name: "Dababy", id: ArtistID.dababy)
        let johnMayer = FavoriteArtist(name: "John Mayer", id: ArtistID.johnMayer)
        let drake = FavoriteArtist(name: "Drake", id: ArtistID.drake)
        let cageTheElephant = FavoriteArtist(name: "Cage The Elephant", id: ArtistID.cageTheElephant)
        let fosterThePeople = FavoriteArtist(name: "Foster The People", id: ArtistID.fosterThePeople)
        let elvis = FavoriteArtist(name: "Elvis Presley", id: ArtistID.elvisPresley)
        let daftPunk = FavoriteArtist(name: "Daft Punk", id: ArtistID.daftPunk)
        
        return [dababy, johnMayer, drake, cageTheElephant, fosterThePeople, elvis, daftPunk]
    }()
    
    //Create your own artist
    //MARK: - CRUDDIES
    
    func createArtist() {
        
    }
}
