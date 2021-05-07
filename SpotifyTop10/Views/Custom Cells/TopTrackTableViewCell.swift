//
//  TopTrackTableViewCell.swift
//  SpotifyTop10
//
//  Created by Bryson Jones on 5/6/21.
//

import UIKit

class TopTrackTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistsLabel: UILabel!
    @IBOutlet weak var popImageView: UIImageView!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var explicitButton: UIButton!

    var track: Track? {
        didSet {
            guard let track = track else { return }
            self.updateTableWithTrack(track: track)
        }
    }
    
    func updateTableWithTrack(track: Track) {
        trackTitleLabel.text = track.name
        var artists: String = ""
        for artist in track.artists {
            artists += "\(artist.name), "
        }
        artistsLabel.text = artists
        popLabel.text = "\(track.popularity)"
        
        explicitButton.setTitle(track.explicit ? "EXPLICIT" : "CLEAN", for: .normal)
        explicitButton.backgroundColor = track.explicit ? .red : .lightGray
        explicitButton.layer.cornerRadius = 4
        
        popImageView.image = track.popularity > 85 ? UIImage(systemName: "arrow.up") : UIImage(systemName: "arrow.down")
        popImageView.tintColor = track.popularity > 85 ? .systemGreen : .systemRed
    }

}//End of class
