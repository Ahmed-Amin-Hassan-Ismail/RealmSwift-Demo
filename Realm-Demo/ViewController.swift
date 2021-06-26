//
//  ViewController.swift
//  Realm-Demo
//
//  Created by Amin  on 6/26/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Confirm to protocol
        tableView.dataSource = self
        tableView.delegate = self
        
    }


}


// MARK: - Table View DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // configure cell ...
        cell.textLabel?.text = "Test"
        cell.detailTextLabel?.text = "222-111-000"
        
        return cell
    }
    
    
}


// MARK: - Table View Delegate

extension ViewController: UITableViewDelegate {
    
}
