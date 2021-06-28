//
//  ViewController.swift
//  Realm-Demo
//
//  Created by Amin  on 6/26/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var people = try! Realm().objects(DataModel.self).sorted(byKeyPath: "name", ascending: true)
    var realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Confirm to protocol
        tableView.dataSource = self
        tableView.delegate = self
        
        people = realm.objects(DataModel.self)
        let path = realm.configuration.fileURL
        print(path!)
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Add Contact", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { (_) in
            let nameTextField = alertController.textFields![0] as UITextField
            let teleTextField = alertController.textFields![1] as UITextField
            
            let newPerson = DataModel(name: nameTextField.text!, telephoneNumber: teleTextField.text!, _id: "")
            
            try! self.realm.write({
                self.realm.add(newPerson)
                self.tableView.reloadData()
            })
        }))
        
        alertController.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "fill your name"
        }
        alertController.addTextField { (teleTextField) in
            teleTextField.placeholder = "011-0069-6071"
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}


// MARK: - Table View DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // configure cell ...
        cell.textLabel?.text = people[indexPath.row].name
        cell.detailTextLabel?.text = people[indexPath.row].talePhoneNumber
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write({
                realm.delete(people[indexPath.row])
                self.tableView.reloadData()
            })
        }
        
    }
}


// MARK: - Table View Delegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
