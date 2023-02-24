//
//  RoverDetailViewController.swift
//  Wall-E-NASA
//
//  Created by Matthew Hill on 2/23/23.
//

import UIKit

class RoverDetailViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet weak var datePickerView: UIPickerView!
    
    @IBOutlet weak var roverTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView.delegate.self
    }
    
    // MARK: - properties
    var rover: Rover?


}

func updateUI() {
}

extension RoverDetailViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let rover = rover else {return nil}
        return rover.earthDay
    }
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
