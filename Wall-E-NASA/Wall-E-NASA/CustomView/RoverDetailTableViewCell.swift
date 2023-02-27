//
//  RoverDetailTableViewCell.swift
//  Wall-E-NASA
//
//  Created by Matthew Hill on 2/25/23.
//

import UIKit

class RoverDetailTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var roverImageView: UIImageView!
    @IBOutlet weak var cameraNameLabel: UILabel!
    

    func fetchImage(rover: Rover) {
        
        RoverController.fetchRoverImage(forRover: rover) { image in
            DispatchQueue.main.async {
                self.roverImageView.image = image
                if image == nil {
                    self.roverImageView.image = UIImage(systemName: "trash.fill")
                }
            }
        }
    }
    
    func updateViews(rover: Rover) {
        cameraNameLabel.text = rover.cameraName
        fetchImage(rover: rover)
    }
}
