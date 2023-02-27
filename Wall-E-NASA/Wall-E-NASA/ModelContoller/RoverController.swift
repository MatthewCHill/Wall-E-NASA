//
//  RoverController.swift
//  Wall-E-NASA
//
//  Created by Matthew Hill on 2/23/23.
//

import UIKit

class RoverModel {
    
    // MARK: - Functions
    
    static func fetchRover(searchDate: String, completion: @escaping ([Rover]?) -> Void) {
        //https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=1NJ993LrgzwCykkBLqsaIeKbx51taDqemi4s72jE
        // Construct the URL
        
        guard let baseURL = URL(string: Constants.NasaURL.baseURL) else {completion(nil); return}
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(contentsOf: Constants.NasaURL.roverPath)
        let queryPath = URLQueryItem(name: Constants.QueryComponents.firstQueryKey, value: searchDate)
        let apiQueryKey = URLQueryItem(name: Constants.QueryComponents.apiQueryKey, value: Constants.QueryComponents.apiQueryValue)
        urlComponents?.queryItems = [queryPath,apiQueryKey]
        
        guard let finalURL = urlComponents?.url else {completion(nil); return}
        print(finalURL)
        
        // Fetch the data with the url
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data = data else {completion(nil); return}
            do {
                let photosArray = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
                guard let topLevel = photosArray?["photos"] as? [[String : Any]] else {completion(nil); return}
                let rovers = topLevel.compactMap {Rover(roverDict: $0)}
                
                completion(rovers)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        } .resume()
    }
    
    static func fetchRoverImage(searchDate: String, forRover: Rover, completion: @escaping (UIImage?) -> Void) {
        guard let baseURL = URL(string: Constants.NasaURL.baseURL) else {completion(nil); return}
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(contentsOf: Constants.NasaURL.roverPath)
        let queryPath = URLQueryItem(name: Constants.QueryComponents.firstQueryKey, value: searchDate)
        let apiQueryKey = URLQueryItem(name: Constants.QueryComponents.apiQueryKey, value: Constants.QueryComponents.apiQueryValue)
        urlComponents?.queryItems = [queryPath,apiQueryKey]
        guard let finalURL = urlComponents?.url else {completion(nil); return}
        print(finalURL)
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
        
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return }
            
            let roverImage = UIImage(data: data)
            completion(roverImage)
        } .resume()
    }
    
    
} // End of class
