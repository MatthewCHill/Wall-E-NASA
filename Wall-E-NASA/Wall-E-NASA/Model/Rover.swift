//
//  Rover.swift
//  Wall-E-NASA
//
//  Created by Matthew Hill on 2/23/23.
//

import Foundation

class Rover {
    
    let earthDay: String
    let camerName: String
    let roverImage: String
    
    enum Keys: String {
        
        case cameraName = "name"
        case earthDay = "earth_date"
        case roverImage = "img_src"
    }
    
    init?(roverDict: [String : Any]) {
        guard let earthDay = roverDict[Keys.earthDay.rawValue] as? String,
              let roverImage = roverDict[Keys.roverImage.rawValue] as? String,
              let cameraDict = roverDict["camera"] as? [String : Any],
              let camerName = cameraDict[Keys.cameraName.rawValue] as? String else {return nil}
        self.earthDay = earthDay
        self.roverImage = roverImage
        self.camerName = camerName
    }
}
