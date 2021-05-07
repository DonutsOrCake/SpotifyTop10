//
//  TopTracksTableViewController.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import UIKit

class TopTracksTableViewController: UITableViewController {
    
    // MARK: - OUTLETS
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - PROPERTIES
    var tracks: [Track] = []
    var artist: FavoriteArtist? {
        didSet {
            guard let artist = artist else { return }
            fetchArtist(for: artist)
            
        }
    }
    
    func fetchArtist(for artist: FavoriteArtist) {
        TopTrackController.fetchTracks(for: artist.id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let tracks):
                    for track in tracks {
                        print(track.name)
                    }
                    self.tracks = tracks
                    self.tableView.reloadData()
                case .failure(let error):
                    print("ERROR! \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "topTrackCell", for: indexPath) as? TopTrackTableViewCell else { return UITableViewCell() }
        
        cell.track = tracks[indexPath.row]
        
        return cell
    }
}//End of class
