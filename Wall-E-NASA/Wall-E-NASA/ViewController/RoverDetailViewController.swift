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
    
    @IBOutlet weak var roverTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - properties
    var rover: Rover?
    
    
}

func updateUI() {
}

extension RoverDetailViewController: UISearchBarDelegate {
    
}



extension RoverDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let rover = rover else {return 0}
        return rover.camerName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roverCell", for: indexPath)
        return cell
    }
    
    
}
