//
//  RoverDetailViewController.swift
//  Wall-E-NASA
//
//  Created by Matthew Hill on 2/23/23.
//

import UIKit

class RoverDetailViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet weak var dateSearchBar: UISearchBar!
    
    
    @IBOutlet weak var roverInformationTableView: UITableView!
    @IBOutlet weak var roverTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roverTableView.delegate = self
        dateSearchBar.delegate = self
        roverTableView.dataSource = self
    }
    
    // MARK: - properties
    var rovers: Rover?
    
    
}

func updateUI() {
    
}

extension RoverDetailViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchDate = searchBar.text, !searchDate.isEmpty else { return }
        RoverModel.fetchRover(searchDate: searchDate) { rover in
            guard let rover = rover else { return }
            self.rovers = rover
            DispatchQueue.main.async {
                self.roverTableView.reloadData()
            }
        }
    }
}



extension RoverDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let rover = rovers else {return 0}
        return rover.cameraName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "roverCell", for: indexPath) as? RoverDetailTableViewCell else { return UITableViewCell()}
        
        var config = cell.defaultContentConfiguration()
        config.text = rovers?.cameraName
        cell.contentConfiguration = config
        return cell
    }
    
    
}
