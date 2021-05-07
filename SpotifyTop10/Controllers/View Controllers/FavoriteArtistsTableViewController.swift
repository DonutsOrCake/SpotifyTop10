//
//  FavoriteArtistsTableViewController.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import UIKit

class FavoriteArtistsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteArtistController.sharedInstance.artists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteArtistCell", for: indexPath)
        
        let artist = FavoriteArtistController.sharedInstance.artists[indexPath.row]
        
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTopTracksVC" {
            guard let index = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TopTracksTableViewController else { return }
            
            let artistToSend = FavoriteArtistController.sharedInstance.artists[index.row]
            destinationVC.artist = artistToSend
        }
    }
}//End of class
