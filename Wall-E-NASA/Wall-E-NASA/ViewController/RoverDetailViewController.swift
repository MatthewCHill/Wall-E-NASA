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
    var rover: Rover?
    var rovers: [Rover?] = []
    
    
}

extension RoverDetailViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchDate = searchBar.text, !searchDate.isEmpty else { return }
        RoverController.fetchRover(searchDate: searchDate) { rovers in
            guard let rover = rovers else { return }
            self.rovers = rover
            DispatchQueue.main.async {
                self.roverTableView.reloadData()
            }
        }
    }
}

extension RoverDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rovers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "roverCell", for: indexPath) as? RoverDetailTableViewCell else { return UITableViewCell()}
        
        guard let rover = rovers[indexPath.row] else { return UITableViewCell()}
        cell.updateViews(rover: rover)
        return cell
    }
    
    
}
