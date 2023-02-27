//
//  Constants.swift
//  Wall-E-NASA
//
//  Created by Matthew Hill on 2/23/23.
//

import Foundation

struct Constants {
    // https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=1NJ993LrgzwCykkBLqsaIeKbx51taDqemi4s72jE
    
    struct NasaURL {
        
        static let baseURL = "https://api.nasa.gov/mars-photos/api/v1"
        static let roverPath = "/rovers/curiosity/photos"
    }
    
    struct QueryComponents {
        
        static let firstQueryKey = "earth_date"
        static let apiQueryKey = "api_key"
        static let apiQueryValue = "1NJ993LrgzwCykkBLqsaIeKbx51taDqemi4s72jE"
    }
}
